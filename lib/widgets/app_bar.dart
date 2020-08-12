import 'package:flutter/material.dart';
 
class Appbar extends StatefulWidget implements PreferredSizeWidget{
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  
Icon custIcon = Icon(Icons.search);

  Widget textBar = Text("Readme" );
  @override
  Widget build(BuildContext context) {
    return AppBar(
                      iconTheme: new IconThemeData(color: Colors.white),

                title: textBar,
                
                backgroundColor: Colors.brown[400],
                elevation: 0.0,
                actions: <Widget>[
                  IconButton( onPressed: (){
setState(() {
  if( this.custIcon.icon == Icons.search){
    this.custIcon = Icon(Icons.cancel);
  this.textBar =TextField(
    style: TextStyle(fontSize: 20),
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