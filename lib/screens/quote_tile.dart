import 'package:flutter/material.dart';
import 'package:reading/models/quote.dart';

class QuoteTile extends StatelessWidget {
  final Quote quote;
  QuoteTile ({this.quote});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
        child: ListTile(
          title: Text(quote.text),
          subtitle: Text(quote.titre +' '+quote.author),
      ),
      ),
    );
  }
}