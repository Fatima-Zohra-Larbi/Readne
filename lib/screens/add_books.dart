

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reading/widgets/app_bar.dart';

class AddBooks extends StatefulWidget {
  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
final filenom= TextEditingController();
final fileauthor= TextEditingController();

    final _formKey = GlobalKey<FormState>();
    List<String> _colors = <String>['', 'تاريخي', 'شعر', 'فلسفي','روايات عربية', 'علمي', 'ديني', 'تطوير الذات','روايات مترجمة'];
  String title, author,description,image,type;
  double rating; 
    final mainReference = FirebaseDatabase.instance.reference().child('Database');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
          body:  Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    controller: filenom,

                    decoration: const InputDecoration(
                      icon: const Icon(Icons.title),
                      hintText: 'Enter the book title',
                      labelText: 'Title',
                      
                    ),
                     onSaved: (String val) {
                     title = val;
                        }
                  ),
                  new TextFormField(
                    controller: fileauthor,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person_outline),
                      hintText: 'Enter the author name',
                      labelText: 'Author',
                    ),
                     onSaved: (String val) {
                     author= val;
                        }
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.image),
                      hintText: 'Enter an image',
                      labelText: 'Image URL',
                    ),
                    keyboardType: TextInputType.url,
                     onSaved: (String val) {
                     image = val;
                        }
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.star_half),
                      hintText: 'Enter a rating',
                      labelText: 'Rating',
                    ),
                    keyboardType: TextInputType.number,
                     onSaved: (String val) {
                    rating = double.parse(val);
                        }
                  ),
                   new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.wrap_text),
                      hintText: 'Enter a description',
                      labelText: 'Description',
                    ),
                    keyboardType: TextInputType.multiline,
                     onSaved: (String val) {
                     description = val;
                        }
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.merge_type),
                          labelText: 'Type',
                        ),
                        isEmpty: type == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: type,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                // newContact.favoriteColor = newValue;
                                type = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Enregistrer'),
                        onPressed:()
                        {
                          print('hello world');
                          
                          if (_formKey.currentState.validate() ){
      //No error in validator
     _formKey.currentState.save();
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = Firestore.instance.collection('books');

        await reference.add({"titre": "$title", "author": "$author",
        "description": "$description", "image": "$image","rating": rating, "favoris": false,"type": "$type"});
      });
    } 

  
                        },
                      )),
                ],
              )),
              floatingActionButton: FloatingActionButton(
        onPressed: () {
getPdfAndUpload();
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );

  }
  Future getPdfAndUpload()async{
    
    File file;
    file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '${filenom.text}.pdf';
    //function call
    savePdf(file.readAsBytesSync(), fileName);
  }
  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    //function call
    documentFileUpload(url);
  }
  String CreateCryptoRandomString([int length = 32]) {
    final Random _random=Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
    //generate key
  }
  void documentFileUpload(String str) {
    var data = {
      "PDF":str,
      "FileName":filenom.text,
      "Author": fileauthor.text,
      //store data
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
  }
}
 