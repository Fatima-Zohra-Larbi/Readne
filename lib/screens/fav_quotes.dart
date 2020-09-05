import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';
class FavQuotes extends StatefulWidget {
  @override
  _FavQuotesState createState() => _FavQuotesState();
}

class _FavQuotesState extends State<FavQuotes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Appbar(),
      //get all the quotes and favorise some of them
          body: StreamBuilder(
        stream: Firestore.instance.collection('quotes').where('favoris',isEqualTo: true).snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, pos) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child:Card(
      child: Column(
        children: <Widget>[
              ListTile(
                
                title: Text('${snapshot.data.documents[pos]['text']}'),
                subtitle: Text('${snapshot.data.documents[pos]['author']},${snapshot.data.documents[pos]['titre']}' ),
                trailing: snapshot.data.documents[pos]['favoris']
                  ? Icon(Icons.favorite,color: Colors.red,)
                  : Icon(Icons.favorite_border),
                   onTap: () {
                setState(() {
                  print(snapshot.data.documents[pos].documentID);
            Firestore.instance.collection('quotes').document(snapshot.data.documents[pos].documentID).updateData({'favoris': !snapshot.data.documents[pos]['favoris']});  
                            //if()
                });
                   }
              ),
        ],
      ),
    ),
              );
        },
      );
            }
          ),
                    bottomNavigationBar: BottomNav(),

    );
  }
}
