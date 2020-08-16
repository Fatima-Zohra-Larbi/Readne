


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/book_details.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';

class AuthorDetails extends StatefulWidget {
       final DocumentSnapshot choix;

  const AuthorDetails({Key key, this.choix}) : super(key: key);

  @override
  _AuthorDetailsState createState() => _AuthorDetailsState();
}

class _AuthorDetailsState extends State<AuthorDetails> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('document id'+widget.choix['name']);
                return Scaffold(
                  
                  appBar: Appbar(),
                  body: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
            height: 180,
                          decoration: BoxDecoration(
            color: Colors.green,
              borderRadius: new BorderRadius.only(
                                                bottomLeft:  const  Radius.circular(80.0),
                          ),
                           
                
                
                          ),
                          
                          child:  Padding(
                            padding: const EdgeInsets.only(top:120.0,left: 40),
                            child: new TabBar(
                              indicatorColor: Colors.transparent,
                controller: _controller,
            tabs: [
              new Tab(
                icon: const Icon(Icons.description),
              ),
              new Tab(
                icon: const Icon(Icons.collections_bookmark),
              ),
            ],
          ),
                          ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left:155),
                 child: Container(
                 width: 100,
                 height: 100,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: new NetworkImage(widget.choix['image']),
                        fit: BoxFit.fill,
                    ),),),
               ),
               Positioned(left: 150,
                 top: 100,
        
                 child:Text(widget.choix['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),) ,
       
       )

       //change this as needed
       
                ],
              ),
      new Container(
  height: 500,
  child: new TabBarView(
    controller: _controller,
    children: <Widget>[
     Padding(
       padding: const EdgeInsets.fromLTRB(8, 20, 8,0),
       child: Container(
         child: Text(widget.choix['description'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),textAlign: TextAlign.right,),
       ),
     ),
     
       new StreamBuilder( 
        stream: Firestore.instance.collection('books').snapshots(),
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
      
    ],
  ),
),
            ],
          ),
          bottomNavigationBar: BottomNav(),
    );
  }
}