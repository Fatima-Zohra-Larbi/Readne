import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final IconData icon;
  final Widget name;
  BottomNavigation(this.icon,this.name);
  @override
  Widget build(BuildContext context) {

     return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(icon,size: 27,color:Colors.black,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => name));
                  
                  },
                  ),
                  SizedBox(height: 1,),

                ],
              ),
            );
  }
}