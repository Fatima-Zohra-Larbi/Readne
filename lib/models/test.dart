/* import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

import 'file.dart';

// Change this to fit the PDF file you are using to test.
const String _documentPath = 'PDFs/Capture.pdf';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opening a PDF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.
  Future<String> prepareTestPdf() async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opening a PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
  onPressed: () => {
        // We need to prepare the test PDF, and then we can display the PDF.
        prepareTestPdf().then((path) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullPdfViewerScreen(path)),
          );
        })
      },
  child: const Text('Open PDF with full_pdf_viewer'),
),
          ],
        ),
      ),
    );
  }
} */


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'author.dart';
import 'file.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pdf With Firebase"),
      ),
      body: itemList.length==0?Text("Loading"):
                       ListView.builder(
              itemCount:itemList.length,
              itemBuilder: (context,index){
                if(itemList[index].name =='My new book')
                return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: GestureDetector(
                      onTap: (){
                        String passData =itemList[index].link;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>ViewPdf(),
                                settings: RouteSettings(
                                  arguments: passData,
                                )
                            )
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/new.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 140,
                              child: Card(
                                margin: EdgeInsets.all(18),
                                elevation: 7.0,
                                child: Center(
                                  child: Text(itemList[index].name+" "+(index+1).toString()),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                );
              },
            ),
         
      
    );
  }
  

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap){
      var data=snap.value;
      itemList.clear();
      data.forEach((key,value){
Modal m=new Modal(value['PDF'],value['FileName'],value['Author']);
itemList.add(m);
      });
      setState(() {
        print('value is');
        print(itemList.length);
      });
     //get data from firebase
    });
  }


}