import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class BLAH extends StatelessWidget {
  final String title;
  final double percent;
  final String grams;
  final Color color;
  
  const BLAH({super.key, required this.title, required this.color, required this.percent, required this.grams});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0XFFEAEBED),
              fontSize: 18,
            ),
          ),
          LinearPercentIndicator(
            width: 100,
            animation: true,
            lineHeight: 2,
            animationDuration: 1000,
            percent: percent,
            barRadius: const Radius.circular(3),
            progressColor: color,
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0XFFEAEBED),
          ),
          Text(
            grams,
            style: const TextStyle(
              color: Color(0XFFEAEBED),
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}
