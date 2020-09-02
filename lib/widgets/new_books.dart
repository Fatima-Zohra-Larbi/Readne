 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/models/test.dart';
 class NewBooks extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return //Scaffold(
     StreamBuilder( 
      stream: Firestore.instance.collection('books').limit(10).orderBy('titre').snapshots(),
      builder: (context, snapshot) {
     return  ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.documents.length,
           //add the length of your list here
          itemBuilder: (BuildContext context, int index) {
            

                   return  Column(
                      children: [
                       InkResponse(
                                                child: Card(
                          child:ClipRRect(
                                          child: Image.network (snapshot.data.documents[index]['image'] ,
                            fit: BoxFit.fill,
                            height: 150,
                            width: 120,
                            
                            
                            ),
                                                       borderRadius: BorderRadius.circular(10),

                          ),
                      ),
                       onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetails(book: snapshot.data.documents[index]),  ),);},
                       ),
                  
                     Text(snapshot.data.documents[index]['titre']),   
                                  
                   
      RatingBarIndicator(
    rating: snapshot.data.documents[index]['rating'],
    itemBuilder: (context, index) => Icon(
           Icons.star,
           color: Colors.red[300],
    ),
    itemCount: 5,
    itemSize: 10.0,
    direction: Axis.horizontal,
    unratedColor: Colors.grey[300],

),
                    ],
                    );
              
          });
      }
    
    );
   }
 }
