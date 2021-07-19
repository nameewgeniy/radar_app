import 'package:flutter/material.dart';

class SecondHeader extends StatelessWidget {

  final String text;

  SecondHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15
      ),
    );
  }

}