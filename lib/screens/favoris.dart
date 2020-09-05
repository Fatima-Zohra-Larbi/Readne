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
      
         body:  
         
         Column(
           children: [
             Container(
            height: 70.0,
            color:  Color(0xffFCFFFD),
            child: Stack(
              children: <Widget>[
                
                Positioned(
                  top: 8.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.green.withOpacity(0.5), width: 1.0),
                          color: Colors.white10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "ادخل اسم المؤلف ", 
                                focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white60),
        borderRadius: BorderRadius.circular(25.7),
      ),
  ),
                              textAlign: TextAlign.center,
                            
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
             Expanded(
                            child: Padding(
                 padding: const EdgeInsets.only(top:10.0),
                 child: StreamBuilder(
        stream: Firestore.instance
      .collection("books")
      .where("favoris", isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
               return ListView.builder(
    itemCount: snapshot.data.documents.length,
    itemBuilder:(BuildContext context, int index) {
      
    return new  Container(
                                   decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.green[50],
                  blurRadius: 1.0,
                  offset: new Offset(0.0, 0.0),
                ),
        ],
                                   ),
   child: Card(
      
      child: new Column(
    
    children: <Widget>[
      new ListTile(
        
        leading:
               Image.network (snapshot.data.documents[index]['image'],
                fit: BoxFit.fitHeight,
                 width: 50,
                 
        ),

        title: new Text(
                snapshot.data.documents[index]['titre'],
                style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.black),
        ),
        subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(snapshot.data.documents[index]['author'],
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.normal)),
                    new Text('Rating: ${snapshot.data.documents[index]['rating']}',
                        style: new TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.normal)),
                  ]),
        //trailing: ,
        onTap: () {
Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(book: snapshot.data.documents[index]),
                      ),);        },
      )
    ],
  ),));
  }
  );
}
 
      
      
    ),
               ),
             ),
           ],
         ),
                    bottomNavigationBar: BottomNav(),

    );
  }
}
