import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/add_books.dart';
import 'package:reading/screens/home_author.dart';
import 'package:reading/screens/page_type.dart';
import 'package:reading/widgets/new_books.dart';

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
     UserAccountsDrawerHeader(
       decoration: BoxDecoration(
         color: Colors.black,
       ),
  accountName: Text("Larbi Fatima Zohra"),
  accountEmail: Text("larbifatima@gmail.com"),
  currentAccountPicture: CircleAvatar(
backgroundImage: AssetImage('assets/popular.jpg'),  ),
),
Text('تصنيفات الكتب',textAlign:TextAlign.center ,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
      ListTile(
        title: Text('روايات عربية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
            Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'روايات عربية').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType( querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('روايات مترجمة',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                      Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'روايات مترجمة').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب تاريخية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                      Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'تاريخي').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب علمية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'علمي').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب فلسفية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'فلسفي').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب تطوير الذات',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'تطوير الذات').snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('كتب دينية ',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'ديني').snapshots();

                           Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        title: Text('دواوين شعرية',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
                                Stream one= Firestore.instance.collection('books').where('type', isEqualTo: 'شعر').snapshots();

              Navigator.push(context,  MaterialPageRoute(builder: (context) => PageType(querySnapshot:one)));

        },
      ),
      ListTile(
        
        title: Text('المؤلفون',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
        title: Text('test',textAlign:TextAlign.right ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context) => NewBooks()));
          // Update the state of the app.
          // ...
        },
      ),
    ],
     ),
    );
  }
}