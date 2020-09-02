import 'package:flutter/material.dart';
import 'package:reading/screens/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      home: SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new Home(),
      title: new Text('Welcome In Readme',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://www.pinclipart.com/picdir/big/345-3450811_free-png-download-helping-hands-png-images-background.png'),
      backgroundColor: Colors.green,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white
      
    )
    );
  }
}

