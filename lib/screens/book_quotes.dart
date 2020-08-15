import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading/models/quote.dart';
import 'package:reading/screens/quote_tile.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    final quotes =Provider.of<List<Quote>>(context) ?? [];

        return ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context,index){
            return QuoteTile(
              quote:quotes[index]
            );
          },
      
    );
  }
}