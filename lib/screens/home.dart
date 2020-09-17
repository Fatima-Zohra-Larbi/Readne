import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading/screens/search_result.dart';
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
   final search = TextEditingController();

  @override

  Widget build(BuildContext context) {
    
    return  SafeArea(
                          child:
           Scaffold(

  resizeToAvoidBottomInset: false, // set it to false

                    drawer: DrawerWidget(),
                    backgroundColor:Colors.white,

              //backgroundColor: Color(0xffFCFFFD),
              appBar:Appbar(),
              body:  Column(
               children: <Widget>[
              Container(
            height: 55.0,
            color:  Color(0xffFCFFFD),
            child: Stack(
              children: <Widget>[
                
                Positioned(
                  top: 3.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: DecoratedBox(
                      
                      decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 0.0),
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          Expanded(
                            
                            child: TextField(
                              controller: search,
                              decoration: InputDecoration(
                                hintText: " ادخل اسم الكتاب المراد البحث عنه", 
                                focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white60),
        borderRadius: BorderRadius.circular(25.7),
      ),
  ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                            onPressed: () {
Stream one= Firestore.instance.collection('books').where('titre', isGreaterThanOrEqualTo: search.text  ).snapshots();

                            Navigator.push(context,  MaterialPageRoute(builder: (context) => SearchResult( querySnapshot:one)));
                                                          search.clear();
                                                        

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
              
                  Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     
                        Text('جديد الكتب',
                       style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 21,fontFamily: 'fatima'),),
                      Image.asset('assets/new.png', width:40, height:50,),      
                                   ],
                 ),
               
               
                         Expanded(
                           child:Container(  child: NewBooks()),),
                           
Padding(
                 padding: const EdgeInsets.only(left:245),
                 child: Text('متوفر في المكتبة',
                 style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,fontFamily: 'fatima'),
              
                 ),
               ), 
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

