import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/add_books.dart';
import 'package:reading/screens/home_author.dart';
import 'package:reading/screens/page_type.dart';
import 'package:reading/screens/quotes.dart';
import 'package:reading/models/test.dart';


class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
     SizedBox(height: 10,),
ListTile(
  
   trailing:
         Icon (Icons.library_books,color: Colors.green,
           
        ),
        title: Text('تصنيفات الكتب',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),    
        ListTile(
        title: Text('روايات عربية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
            Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'روايات عربية').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType( querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('روايات مترجمة',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                      Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'روايات مترجمة').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب تاريخية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                      Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'تاريخي').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب علمية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'علمي').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب فلسفية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'فلسفي').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب تطوير الذات',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'تطوير الذات').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب دينية ',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'ديني').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('دواوين شعرية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'شعر').snapshots();

              Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
         trailing:
         Icon (Icons.format_quote,color: Colors.green,
           
        ),
        title: Text('اقتباسات',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => Quotes()));
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
         trailing:
         Icon (Icons.person,color: Colors.green,
           
        ),
        title: Text('مؤلفون',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => HomePage()));

        },
      ),
        ListTile(
        title: Text('Add books',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => AddBooks()));
          // Update the state of the app.
          // ...
        },
      ),
       ListTile(
        title: Text('pdf',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => FirstPage()));
          // Update the state of the app.
          // ...
        },
      ),
       
    ],
     ),
    );
  }
}