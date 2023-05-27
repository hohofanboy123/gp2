import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Macros extends StatelessWidget {
  final double percent;
  final LinearGradient color;
  final Color bgColor;
  final FaIcon icon;
  final String name;
  final String grams;
  const Macros({
    super.key,
    required this.percent,
    required this.color,
    required this.bgColor,
    required this.icon,
    required this.name,
    required this.grams,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(vertical: 5),
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: bgColor)
        ),
        height: 40,
        width: 40,
        child: Center(
          child: icon
        )
      ),
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width/1.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontSize: 15)),
                Text(grams, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.symmetric(horizontal: 0),
            percent: percent,
            width: Get.width / 1.4,
            barRadius: Radius.circular(30),
            lineHeight: 15,
            linearGradient: color,
            backgroundColor: bgColor,
          ),
        ],
      ),
    ],
  ),
);


  }
}

class DailyMacros extends StatelessWidget {
  final Color color;
  final String name;
  final String amount;
  const DailyMacros({super.key, required this.color, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return 
                                Column(
                                  children: [
                                    LinearPercentIndicator(
                                      progressColor: color,
                                      percent: 0.5,
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      width: 80,
                                      lineHeight: 5,
                                      barRadius: Radius.circular(30),
                                    ),
                                    Text(name, style: TextStyle(fontSize: 10,color: Colors.white,),),
                                    Text(amount, style: TextStyle(color: Colors.white,),),
                                  ],
                                );
  }
}