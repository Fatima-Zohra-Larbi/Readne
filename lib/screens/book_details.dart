
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

class _BookDetailsState extends State<BookDetails> {
Icon _favorite = new Icon(
  Icons.favorite,
  color: Colors.green,
);
  Icon _notfavorite = new Icon(
  Icons.favorite_border,
  color: Colors.black,
);
  
  @override
  Widget build(BuildContext context) {



       
        return Scaffold(
          backgroundColor: Color(0xffFCFFFD),
          appBar: Appbar(),
          
          
           body:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(height: 10,),
                 Row(
                   children: <Widget>[
                    
                         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(40)
           ),
           child: Padding(padding: const EdgeInsets.all(4),
                              child: Image.network(widget.book['image'],height: 200,width: 200,
                            ),
                         ),
                         ),
                     
                    
    
            
                     Column(
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
          SizedBox(height:12),
    
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
               ],
             ),
             SizedBox(height: 7,),
             /************** */  //GOODREADS RATING /******************* */
             Text('GoodReads Rating :${widget.book['rating']}',
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
             ),),
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
 /******************** */  // DESCRIPTION OF THE BOOK /****************** */
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

           /******************** */  // THE BOOK'S QUOTES LIST  //************** */ 
      Padding(
padding: EdgeInsets.only(right:1),   
            child: Text('اقتباسات من الكتاب', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
            textAlign:TextAlign.start)
               ),

             
           
               

 
   

   // var result =  Firestore.instance
     // .collection("quotes")
     // .where("titre", isEqualTo: '${widget.book['titre']}')
      //.getDocuments();
  //result.documents.forEach((res) {
    //print(res.data['titre']);
    //});),


/*
       
        /* Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for ( var i in calledQuotes)
            if(i.titre == widget.book['titre'])
             Padding(
               padding: const EdgeInsets.all(6.0),
               child: Text(i.text ,textAlign: TextAlign.right, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300), ),
             )

            
            
          ],
        ),*/
      ),*/
      //  child: Text('${book.rating}'),
                
                
                
           ],
         ),
       ),
              bottomNavigationBar: BottomNav(),
    );
  }
}