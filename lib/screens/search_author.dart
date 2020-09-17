import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reading/widgets/author_row.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:readmore/readmore.dart';

import 'book_details.dart';

class SearchAuthor extends StatefulWidget {
         final String choix;

  const SearchAuthor({Key key, this.choix}) : super(key: key);

  @override
  _SearchAuthorState createState() => _SearchAuthorState();
}

class _SearchAuthorState extends State<SearchAuthor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  
                   appBar: AppBar(
                     iconTheme: new IconThemeData(color: Colors.black),
                title: Text('Readme' ,style: TextStyle(color: Colors.black,fontFamily: 'fatima'),),
                backgroundColor: Colors.green,
                elevation: 0,

                  ),
                  body: StreamBuilder(
                    stream:   Firestore.instance.collection('authors').where('name',isGreaterThanOrEqualTo: widget.choix).snapshots(),

                    builder: (context, snapshot) {
          return new Container(
            color: Color(0xffFCFFFD),
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                        (context, index) => new PlanetRow(author:snapshot.data.documents[index]),
                      childCount: snapshot.data.documents.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}