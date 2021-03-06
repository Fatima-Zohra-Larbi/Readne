import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/screens/book_details.dart';

 
class BookList extends StatefulWidget {

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  
  @override
  Widget build(BuildContext context) {
   return  StreamBuilder( 
      stream: Firestore.instance.collection('books').orderBy('author').snapshots(),
      builder: (context, snapshot) {
     return  Container(
       
        child: DecoratedBox(
                                decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[200].withOpacity(0.5), width: 1.0),
                              color: Colors.white10),
       child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents.length,
            
             //add the length of your list here
            itemBuilder: (BuildContext context, int index) {
              

                     return  Column(
                children: [
                           Container(
                             decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.green[50],
            blurRadius: 5.0,
            offset: new Offset(2.0, 1.0),
          ),
        ],
                             ),
                             
                             child: InkResponse(
                                                      child: Card(
                                child:ClipRRect(
                                                child: Image.network (snapshot.data.documents[index]['image'] ,
                                  fit: BoxFit.fill,
                                  height: 140,
                                  width: 105,
                                  
                                  
                                  ),
                                                             borderRadius: BorderRadius.circular(4),

                                ),
                          ),
                             onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(book: snapshot.data.documents[index]),  ),);},
                             ),
                             
                           ),
                    
                         Column(
                           children: [
                             Container(
                               height:20,
                               child: Text(snapshot.data.documents[index]['titre'],
                               style:TextStyle(color:Colors.black,fontSize: 14,fontWeight: FontWeight.bold))),
                              Container(
                                height: 12,
                                child: RatingBarIndicator(
    rating: snapshot.data.documents[index]['rating'],
    itemBuilder: (context, index) => Icon(
             Icons.star,
             color: Colors.amber[500],
    ),
    itemCount: 5,
    itemSize: 10.0,
    direction: Axis.horizontal,
    unratedColor: Colors.grey[300],

),
                              ),
                           ],

                         ),   
                                      
                       
       
                        ],

                        );
                       
                     
        
                
            }),
     ),
     );
          
      }
    
    );
   /* return StreamBuilder(
        stream: Firestore.instance.collection('books').snapshots(),
      builder: (context, snapshot) {
        return OrientationBuilder(
  builder: (context, orientation) {
                        return GridView.count(
                                crossAxisCount:  2 ,

              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                


              // Generate  widgets that display their index in the List.
              children: 
              
              List.generate(snapshot.data.documents.length, (index) {
                return Container(
                  
                  padding: EdgeInsets.only(left: 8,right: 8),
                  child: InkResponse(
                    //********** */ Go to page BookDetails **************
                    onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetails(book: snapshot.data.documents[index]),  ),);},
                                  child: GridTile(

                        //************ Rating box ************** */
                      header:   Padding(
  padding: const EdgeInsets.only(right: 109),
  child:  Container(
        decoration: BoxDecoration(
        
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
child: Row(
  children: <Widget>[
        Padding(padding: const EdgeInsets.all(2),
        child: Icon(
          Icons.star,
          color: Colors.yellow[900],
          size: 20,
        ),
        ),
        Text('${ snapshot.data.documents[index]['rating']}'),
  ],
),
  ),
),
//****************** THE BOOK PICTURE IN GRID *************** */
                                    child: ClipRRect(
                                      child: Image.network (snapshot.data.documents[index]['image'] ,
                        fit: BoxFit.fill,
                        
                        ),
                                                   borderRadius: BorderRadius.circular(10),

                      ),
                      
                    ),
                  ),
                );*/
              }
           /*   ),

              
                   );
  }
                      );
      }
    );*/
  }
