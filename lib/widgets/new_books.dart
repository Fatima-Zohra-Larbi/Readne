 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/screens/book_details.dart';
 class NewBooks extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return //Scaffold(
     StreamBuilder( 
      stream: Firestore.instance.collection('books').limit(10).orderBy('titre').snapshots(),
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
   }
 }
