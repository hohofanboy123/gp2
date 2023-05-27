import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Nutrients extends StatelessWidget {
  const Nutrients({
    super.key, required this.color, required this.amount, required this.title, required this.percent,
  });
  final Color color;
  final String amount;
  final String title;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
      quarterTurns: -1,
      child: LinearPercentIndicator(
        padding: EdgeInsets.symmetric(horizontal: 0),
        barRadius: Radius.circular(30),
        lineHeight: 8.0,
        width: 30,
        percent: percent,
        progressColor: color,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(amount),
          Text(title),
        ],
      ),
    ),
      ],
    );
  }
}
