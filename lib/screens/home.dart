import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/book_list.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:reading/widgets/drawer.dart';
import 'package:reading/widgets/new_books.dart';

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

              backgroundColor: Color(0xffFCFFFD),
              appBar:Appbar(),
              body:  Column(
               children: <Widget>[
              Container(
            height: 70.0,
            color:  Color(0xffFCFFFD),
            child: Stack(
              children: <Widget>[
                
                Positioned(
                  top: 8.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.green.withOpacity(0.5), width: 1.0),
                          color: Colors.white10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "ادخل اسم الكتاب ", 
                                focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white60),
        borderRadius: BorderRadius.circular(25.7),
      ),
  ),
                              textAlign: TextAlign.center,
                            
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
               Text('جديد الكتب',
               style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800],fontSize: 25,),
               textAlign: TextAlign.right,
               ),
                         Expanded(child:Container(child: NewBooks()),),

               SizedBox(height: 5),
                  Expanded(
                child:  Container(child: BookList()),
                  ),
                  
            
               ],
              
              ),
              bottomNavigationBar: 
              BottomNav(),

          ),
             
  
    );
  }
}

