import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/favoris.dart';
import 'package:reading/screens/quotes.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/book_list.dart';
import 'package:reading/models/bottom_navigation.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:reading/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override

  Widget build(BuildContext context) {
    
    return  SafeArea(
                          child:
           Scaffold(

  resizeToAvoidBottomInset: false, // set it to false

                    drawer: DrawerWidget(),

              backgroundColor: Colors.brown[50],
              appBar:Appbar(),
              body:  Column(
               children: <Widget>[
             
                      SizedBox(height: 3,),
               Text('جديد الكتب',
               style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800],fontSize: 25,),
               textAlign: TextAlign.right,
               ),
               SizedBox(height: 5),
                  Expanded(
                child:  Container(child: BookList()),
                  ),
                  
            
               ],
              
              ),
              bottomNavigationBar: BottomNav(),

          ),
             
  
    );
  }
}

