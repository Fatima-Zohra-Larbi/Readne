import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/search_result.dart';
 
class Appbar extends StatefulWidget implements PreferredSizeWidget{
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final search =TextEditingController();
Icon custIcon = Icon(Icons.search);

  Widget textBar = Text("Readme" );
  @override
  Widget build(BuildContext context) {
    return AppBar(
                      iconTheme: new IconThemeData(color: Colors.white),

                title: textBar,
                
                backgroundColor: Colors.green,
                elevation: 0.0,
                actions: <Widget>[
                  IconButton( onPressed: (){
setState(() {
  if( this.custIcon.icon == Icons.search){
    this.custIcon = Icon(Icons.cancel);
  this.textBar =TextField(
    style: TextStyle(fontSize: 20),
     controller: search,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white60),
        borderRadius: BorderRadius.circular(25.7),
        
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white60),
        borderRadius: BorderRadius.circular(25.7),
      ),
       filled: true,

                  fillColor: Colors.white60,
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 14),
      hintText: 'أدخل عنوان الكتاب ',
prefixIcon: IconButton(icon: Icon(Icons.search,color: Colors.pink[400],),
 onPressed: (){
 
        print('the result is' +search.text);

 Stream one= Firestore.instance.collection('books').where('titre', isEqualTo: search.text  ).snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => SearchResult( querySnapshot:one)));

}) 
    ),
   
  );
  }
  else {
        this.custIcon = Icon(Icons.search);
        this.textBar= Text("Readme" );

  }

});

                  }, icon: custIcon)
                ],
              );
  }
}