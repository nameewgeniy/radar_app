import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {

  final String text;

  HeaderTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    );
  }

}