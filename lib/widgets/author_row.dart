import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/author_details.dart';
class PlanetRow extends StatelessWidget {

     final DocumentSnapshot author;

  PlanetRow({this.author});

  @override
  
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: FractionalOffset.topLeft,
      child: new Container(
      width: 80.0,
      height: 80.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(author['image'])
                 )
)),
    );

    final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );


    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 2.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Text(author['name'], style: headerTextStyle, ),

             //author['favoris']
             author['favoris']
                  ?  IconButton(icon:Icon(Icons.favorite,color: Colors.red),onPressed: (){
                     
                                        print(' favorite');

                                Firestore.instance.collection('authors').document(author.documentID).updateData({'favoris': !author['favoris']});  

                  },)
                  : IconButton(icon:Icon(Icons.favorite_border),onPressed: (){
                     
                                        print('not favorite');

                                Firestore.instance.collection('authors').document(author.documentID).updateData({'favoris': !author['favoris']});  

                  },)
                  
                 /*  : IconButton(icon:Icon(Icons.favorite_border),onPressed: (){
                    print('the document id is '+author.documentID);
                                Firestore.instance.collection('author').document(author.documentID).updateData({'favoris': !author['favoris']});  

                  },) */
                   
                   
            ],
          ),
          new Container(height: 4.0),
          new Text(author['date'], style: subHeaderTextStyle),
        ],
      ),
    
    );


    final planetCard = new GestureDetector(
    onTap: () {
      print(author.documentID);
      Navigator.push(context,  MaterialPageRoute(builder: (context) => AuthorDetails(choix: author)));
    },
    child: Container(
      child: planetCardContent,
      height: 100.0,
      margin: new EdgeInsets.only(left: 50.0),
      decoration: new BoxDecoration(
        color: new Color(0xFFffffff),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.green[50],
            blurRadius: 8.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    ),
    );


    return new Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 1.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          planetCard,
          planetThumbnail,
        ],
      )
    );
  }
}