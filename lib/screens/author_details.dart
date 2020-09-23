


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/screens/book_details.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:readmore/readmore.dart';

class AuthorDetails extends StatefulWidget {
       final DocumentSnapshot choix;

  const AuthorDetails({Key key, this.choix}) : super(key: key);

  @override
  _AuthorDetailsState createState() => _AuthorDetailsState();
}

class _AuthorDetailsState extends State<AuthorDetails> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
   // debugPrint('document id'+widget.choix['name']);
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
            height: MediaQuery.of(context).size.height*0.23,
                          decoration: BoxDecoration(
            color: Colors.green,
              borderRadius: new BorderRadius.only(
                                                bottomLeft:  const  Radius.circular(80.0),
                          ),
                           
                
                
                          ),
                          
                     
              ),
               Padding(
                 padding: const EdgeInsets.only(left:155),
                 child: Container(
                 width: MediaQuery.of(context).size.height*0.15,
                 height: MediaQuery.of(context).size.height*0.15,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: new NetworkImage(widget.choix['image']),
                        fit: BoxFit.fill,
                    ),),),
               ),
               Positioned(left: 165,
                 top: 100,
        
                 child:Text(widget.choix['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,                         fontFamily:'fatima',
),) ,
       
       )

       //change this as needed
       
                ],
              ),
      
        new Container(
  height: 800,
  child: Column(
    children: [
       Padding(
     padding: const EdgeInsets.only(top:3.0,left:230,bottom:2),
     child: Text(': نبذة عن الكاتب ' ,
     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
   ),
        Padding(
             padding: const EdgeInsets.only(left:20,right: 8),
             child: Container(
               child: ReadMoreText(widget.choix['description'],
               style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),
               trimLines: 3,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                  textAlign:TextAlign.right,
              ),
             ),
           ),
   Padding(
     padding: const EdgeInsets.only(top:3.0,left:150,bottom:10),
     child: Text(': أعمال ${widget.choix['name']} المتوفرة  ' ,
     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
   ),
     Expanded(child: Container( height :200,child:  StreamBuilder( 
          stream: Firestore.instance.collection('books').where('author',isEqualTo:'${widget.choix['name']}').snapshots(),
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
     ),
     
     ),),
         
         /* return OrientationBuilder(
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
                      
                                        padding: EdgeInsets.only(left: 8,right: 8,top:5),
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
                          );*/
          
    
        
     ],
  ),
  
),
      
            ],
          ),
          bottomNavigationBar: BottomNav(),
    );
  }
}