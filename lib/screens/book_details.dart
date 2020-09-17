
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/models/author.dart';
import 'package:reading/models/file.dart';
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
List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    mainReference.once().then((DataSnapshot snap){
      var data=snap.value;
      itemList.clear();
      data.forEach((key,value){
Modal m=new Modal(value['PDF'],value['FileName'],value['Author']);
itemList.add(m);
      });
      setState(() {
        print('value is');
        print(itemList.length);
      });
     //get data from firebase
    });
  }
Icon _favorite = new Icon(
  Icons.favorite,
  color: Colors.white,
);
  Icon _notfavorite = new Icon(
  Icons.favorite_border,
);

  @override
  Widget build(BuildContext context) {



       
       return Scaffold(
                  
                  appBar: AppBar(
                     iconTheme: new IconThemeData(color: Colors.black),
                title: Text('Readme' ,style: TextStyle(color: Colors.black,fontFamily: 'fatima'),),
                backgroundColor: Colors.green,
                elevation: 0,

                  ),
                  body: ListView(

                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
            height: 200,
                          decoration: BoxDecoration(
            color: Colors.green,
              borderRadius: new BorderRadius.only(
                                                bottomLeft:  const  Radius.circular(50.0),
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
 borderRadius: BorderRadius.circular(10),
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
      onPressed: () {
        
        
        
        },
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
                for(int index=0;index< itemList.length;index++){
                  print(itemList[index].name);
                  print(itemList[index].author);
                 print(widget.book['titre']);
                                  print(widget.book['author']);



                if(widget.book['author']  == itemList[index].author && widget.book['titre']  == itemList[index].name)
               
{
  print("true");
String passData =itemList[index].link;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>ViewPdf(),
                                settings: RouteSettings(
                                  arguments: passData,
                                )
                            )
                        );     
                         }
                         }
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
             widget.book['favoris']
                  ?  IconButton(icon:_favorite,onPressed: (){

                    setState(() {
  Firestore.instance.collection('books').document(widget.book.documentID).updateData({'favoris': false});  
                              print('favorite'+widget.book['favoris'].toString());

                      _favorite=_notfavorite;

        });



                  },)
                  : IconButton(icon:_notfavorite,onPressed: (){

setState(() {
      Firestore.instance.collection('books').document(widget.book.documentID).updateData({'favoris': true});  
 _notfavorite=_favorite;
       print('not favorite'+widget.book['favoris'].toString());

                    //_iconColor = Colors.green;
});

                  },),
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
  height: 700,
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
                  textAlign:TextAlign.right,
                   ),
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
  
                        fontSize: 16,
  
                       // fontWeight: FontWeight.w200,

  
                      )
  
                      ,),
  
      );
  
    },
  
      separatorBuilder: (BuildContext context, int index) => const Divider(),
  
  
  
  
);

    
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