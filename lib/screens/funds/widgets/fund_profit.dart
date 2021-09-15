import 'dart:math';

import 'package:flutter/material.dart';

class FundProfit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FundProfitItemHeader("За 1 мес.", ),
              FundProfitItem(Random().nextInt(100).toString() + "%"),
            ],
          ),
          Column(
            children: [
              FundProfitItemHeader("За 3 мес.", ),
              FundProfitItem(Random().nextInt(100).toString() + "%"),
            ],
          ),
          Column(
            children: [
              FundProfitItemHeader("За 6 мес.", ),
              FundProfitItem(Random().nextInt(100).toString() + "%"),
            ],
          ),
          Column(
            children: [
              FundProfitItemHeader("За 1 год.", ),
              FundProfitItem(Random().nextInt(100).toString() + "%"),
            ],
          ),
          Column(
            children: [
              FundProfitItemHeader("За 3 года.", ),
              FundProfitItem(Random().nextInt(100).toString() + "%"),
            ],
          ),
          Column(
            children: [
              FundProfitItemHeader("Весь", ),
              FundProfitItem(Random().nextInt(400).toString() + "%"),
            ],
          ),
        ],
      ),
    );
  }

}

class FundProfitItemHeader extends StatelessWidget {
  final String text;

  FundProfitItemHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, style: TextStyle(
          color: Colors.black54,
        fontSize: 12
      )),
    );
  }
}

class FundProfitItem extends StatelessWidget {
  final String text;

  FundProfitItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:5),
      child: Text(text, style: TextStyle(
        color: Colors.green
      )),
    );
  }
}
