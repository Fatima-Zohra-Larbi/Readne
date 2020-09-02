import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/author_row.dart';
class FavAuthors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     body: new Column(
        children: <Widget>[
          new Appbar(),
     
     Expanded(
      child: StreamBuilder(
        stream:      Firestore.instance.collection('authors').where('favoris',isEqualTo: true).snapshots(),

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
    ),
        ],
     ),
    );
  }
}