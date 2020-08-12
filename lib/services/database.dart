
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reading/models/quote.dart';


 class DatabaseService{
   final String uid;
   DatabaseService({this.uid});
//collection reference
final CollectionReference quoteCollection =Firestore.instance.collection('quotes');

//brew list from snapshot
List <Quote> _quoteListFromSnapshot (QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc) {
  return Quote (author: doc.data['author'] ,
  titre: doc.data['titre'] ,
  text : doc.data['text'],
  favorie: doc.data['favorie']
  );}
   ).toList();
}



// get brews stream
Stream<List<Quote>> get quotes {
  return quoteCollection.snapshots().map(_quoteListFromSnapshot);
}

 }
