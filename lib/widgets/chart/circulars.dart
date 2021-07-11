import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Circulars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Circular(20, "Акции"),
            Circular(88, "Коропоративные облигации"),
          ],
        ),
      ],
    );
  }
}

class Circular extends StatelessWidget {
  final double percent;
  final String title;

  Circular(this.percent, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 8.0,
              percent: percent / 100,
              progressColor: Color.fromARGB(255, 215, 66, 54),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    percent.toInt().toString() + " %",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 150
                  ),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                )
              ],
          )),
        ],
      ),
    );
  }
}
