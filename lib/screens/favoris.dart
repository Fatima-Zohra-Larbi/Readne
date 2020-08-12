import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/models/book.dart';
import 'package:reading/screens/book_details.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';

class Favoris extends StatefulWidget {
  final Book book;

  const Favoris({Key key, this.book}) : super(key: key);

  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      
         body:  Padding(
           padding: const EdgeInsets.only(top:10.0),
           child: StreamBuilder(
        stream: Firestore.instance
      .collection("books")
      .where("favoris", isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
        return OrientationBuilder(
  builder: (context, orientation) {
                          return GridView.count(
                                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,

                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  


                // Generate  widgets that display their index in the List.
                children: List.generate(snapshot.data.documents.length, (index) {
                  return Container(
                    
                    padding: EdgeInsets.only(left: 8,right: 8),
                    child: InkResponse(
                      onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(book: snapshot.data.documents[index]),
                ),);},
                                    child: GridTile(
                        
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

                                      child: ClipRRect(
                                        child: Image.network (snapshot.data.documents[index]['image'] ,
                          fit: BoxFit.fill,
                          
                          ),
                                                     borderRadius: BorderRadius.circular(10),

                        ),
                        
                      ),
                    ),
                  );
                }
                ),

                
                     );
  }
                        );
      }
    ),
         ),
                    bottomNavigationBar: BottomNav(),

    );
  }
}