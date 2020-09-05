import 'package:flutter/material.dart';
import 'package:reading/models/bottom_navigation.dart';
import 'package:reading/screens/fav_authors.dart';
import 'package:reading/screens/fav_quotes.dart';
import 'package:reading/screens/favoris.dart';
import 'package:reading/screens/quote_tile.dart';
import 'package:reading/screens/quotes.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomNavigation( Icons.favorite_border,Favoris()),
            BottomNavigation(Icons.format_quote,FavQuotes()),
            BottomNavigation(Icons.person_pin,FavAuthors()),
            BottomNavigation(Icons.file_download,Quotes()),
              
          ],
        ),
      ),
        
      );
              
  }
}