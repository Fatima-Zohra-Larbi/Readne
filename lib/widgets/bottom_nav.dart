import 'package:flutter/material.dart';
import 'package:reading/models/bottom_navigation.dart';
import 'package:reading/screens/favoris.dart';
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
            BottomNavigation( Icons.favorite,Favoris()),
            BottomNavigation(Icons.format_quote,Quotes()),
              BottomNavigation(Icons.file_download,Quotes()),
              
          ],
        ),
      ),
        
      );
              
  }
}