import 'package:flutter/material.dart';
import 'package:reading/screens/authors.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Appbar(),
      body: new Column(
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
                                hintText: "ادخل اسم المؤلف ", 
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
          new HomePageBody(),
        ],
      ),
            bottomNavigationBar: BottomNav(),

    );
  }
}

