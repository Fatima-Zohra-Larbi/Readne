import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  Icon custIcon = Icon(Icons.search);
  Widget textBar = Text("Readme",
                  style: TextStyle(color: Colors.amber),
                );
  @override

  Widget build(BuildContext context) {
    
    return  
           Scaffold(


              backgroundColor: Colors.white,
              appBar: new AppBar(

                title: textBar,
                

                actions: <Widget>[
                  IconButton( onPressed: (){
setState(() {
  if( this.custIcon.icon == Icons.search){
    this.custIcon = Icon(Icons.cancel);
  this.textBar =TextField();
  }
  else {}

});

                  }, icon: custIcon)
                ],
              ),
             
              

          );
             
  
    
  }
}