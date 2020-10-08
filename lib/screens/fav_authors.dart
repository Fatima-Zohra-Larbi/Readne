import 'package:flutter/material.dart';
import 'package:reading/screens/search_author.dart';
import 'package:reading/widgets/app_bar.dart';
import 'package:reading/widgets/bottom_nav.dart';
import 'package:reading/widgets/fav.author_row.dart';

class FavAuthors extends StatefulWidget {
  @override
  _FavAuthorsState createState() => _FavAuthorsState();
}

class _FavAuthorsState extends State<FavAuthors> {
         final search = TextEditingController();

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
                              color: Colors.grey.withOpacity(0.5), width: 0.0),
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: search,
                              decoration: InputDecoration(
                                hintText: " ادخل اسم المؤلف المراد البحث عنه ", 
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
                              print(search.text);
Navigator.push(context,  MaterialPageRoute(builder: (context) => SearchAuthor(choix: search.text )));
      search.clear();                            },
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          new FavAuthorRow(),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
