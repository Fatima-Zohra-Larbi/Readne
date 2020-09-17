import 'package:flutter/material.dart';
 
class Appbar extends StatefulWidget implements PreferredSizeWidget{
  
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final search =TextEditingController();
Icon custIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
      child: Container(
         color: Colors.grey[200],
         height: 2.0,
      ),
      preferredSize: Size.fromHeight(4.0)),
                      iconTheme: new IconThemeData(color: Colors.black),

                title: Text('Readme' ,style: TextStyle(color: Colors.black,fontFamily: 'fatima'),),
                
                backgroundColor: Color(0xffFAFAFA),
                elevation: 0.0,
              
              );
  }
}