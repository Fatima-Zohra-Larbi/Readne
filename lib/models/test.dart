
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:readmore/readmore.dart';

     
class BookDetails extends StatefulWidget {
  final DocumentSnapshot book;

  const BookDetails({Key key, this.book}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();


}

class _BookDetailsState extends State<BookDetails> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }
Icon _favorite = new Icon(
  Icons.favorite,
  color: Colors.white,
);
  Icon _notfavorite = new Icon(
  Icons.favorite_border,
  color: Colors.black,
);
  
  @override
  Widget build(BuildContext context) {



       
       return Scaffold(
                  
                  appBar: Appbar(),
                  body: ListView(

                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
            height: 200,
                          decoration: BoxDecoration(
            color: Colors.green,
              borderRadius: new BorderRadius.only(
                                                bottomLeft:  const  Radius.circular(80.0),
                                                bottomRight: const  Radius.circular(80.0),
                          ),
                           
                
                
                          ),
                          
                          child:  Padding(
                            padding: const EdgeInsets.only(top:170.0,left: 20),
                            child: new TabBar(
                              indicatorColor: Colors.transparent,
                controller: _controller,
            tabs: [
              new Tab(
                icon: const Icon(Icons.short_text),
              ),
              new Tab(
                icon: const Icon(Icons.format_quote),
              ),
            ],
          ),
                          ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left:40),
                 child: Container(
                 width: 140,
                 height: 165,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        image: new NetworkImage(widget.book['image']),
                        fit: BoxFit.fill,
                    ),),),
               ),
               Positioned(left: 200, top: 1,
        
   child: Column(
                       children: <Widget>[
    
                             /************************/ //DOWNLOAD BOOK BUTTON /********************** */
                         RaisedButton.icon(
      onPressed: () { },
      shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
    
             borderRadius: BorderRadius.all(Radius.circular(10.0))),
      label: Text('تحميل الكتاب', 
             style: TextStyle(color: Colors.black),),
      icon: Icon(Icons.cloud_download, color:Colors.green,), 
       splashColor:  Color(0xffFCFFFD),
      color:  Color(0xffFCFFFD)),
    
                             /************************/ //READ ONLINE BUTTON /********************** */
      RaisedButton.icon(
      onPressed: ()  { 
     
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
             borderRadius: BorderRadius.all(Radius.circular(10.0))),
      label: Text('قراءة مباشرة', 
             style: TextStyle(color: Colors.black),),
      icon: Icon(Icons.open_in_new, color:Colors.black,), 
      splashColor: Colors.brown[400],
      color:  Color(0xffFCFFFD)),
          SizedBox(height:10),
    
    Row(
      children: <Widget>[
                  /*********************/ //ADD TO FAVORITE /******************** */
            IconButton(
       icon : widget.book['favoris'] ? _favorite
      : _notfavorite,
    
    onPressed: (){
    
setState(() {
  if(widget.book['favoris'])
    {_favorite = _notfavorite;} 
     else 
     {_notfavorite =_favorite;}

});
           Firestore.instance.collection('books').document(widget.book.documentID).updateData({'favoris':!widget.book['favoris']}); 

                  //if()
    }),
    /****************************** */ // SHARE IN SOCIAL MEDIA /****************** */
     IconButton(
    
      icon: Icon(Icons.share,color: Colors.black,), 
    
    onPressed: (){}),
  ],
),
  
                   ],
                   
                 ),
               
                    
       )

       //change this as needed
       
                ],
              ),
      new Container(
  height: 500,
  child: new TabBarView(
    controller: _controller,
    children: <Widget>[
      Column(
        children: [
           Padding(
       padding: const EdgeInsets.fromLTRB(8, 20, 8,0),
       child:  Text('GoodReads Rating :${widget.book['rating']}',
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
             ),),

     ),
      RatingBarIndicator(
    rating: widget.book['rating'],
    itemBuilder: (context, index) => Icon(
           Icons.star,
           color: Colors.red[300],
    ),
    itemCount: 5,
    itemSize: 30.0,
    direction: Axis.horizontal,
    unratedColor: Colors.grey[300],

),
Padding(
padding: EdgeInsets.only(right:1),   
            child: Text('نبذة عن الكتاب', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
            textAlign:TextAlign.start)
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ReadMoreText(widget.book['description'], 
                 style: TextStyle(
                   fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500
                 ),
                   trimLines: 3,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                  textAlign:TextAlign.right, ),
               ),
        ],
      ),
    

     
       new StreamBuilder( 
        stream: Firestore.instance.collection('quotes').where('author',isEqualTo:'${widget.book['author']}').
        where('titre',isEqualTo:'${widget.book['titre']}').snapshots(),
        builder: (context, snapshot) {
return   ListView.separated(
  shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(8),
  
    itemCount:snapshot.data.documents.length,
  
    itemBuilder: (BuildContext context, int index) {
  
      return ListTile(
  
        title: Text(snapshot.data.documents[index]['text'],textAlign: TextAlign.right,style: 
  
                      TextStyle(
  
                        fontSize: 18,
  
                        fontWeight: FontWeight.w200
  
                      )
  
                      ,),
  
      );
  
    },
  
      separatorBuilder: (BuildContext context, int index) => const Divider(),
  
  
  
  
);

     /*   return OrientationBuilder(
  builder: (context, orientation) {
                          return GridView.count(
                                  crossAxisCount: orientation == Orientation.portrait ? 1 : 3,

                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                  

                // Generate  widgets that display their index in the List.
                children: List.generate(snapshot.data.documents.length, (index) {
                  return 
                        Container(
                          child: Text(snapshot.data.documents[index]['text'],textAlign: TextAlign.right,style: 
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200
                    )
                    ,),
                        
                  );
                 
                }
                ),

                
                     );
  }
                        );*/
        }
    ),
      
    ],
  ),
),
            ],
          ),
          bottomNavigationBar: BottomNav(),
    );
  }
}