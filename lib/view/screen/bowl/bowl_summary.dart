
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BowlSummary extends StatelessWidget {
  final String title;
  final String amount;
  final String unit;
  final FaIcon icon;
  const BowlSummary({super.key, required this.title, required this.amount, required this.unit, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 20,
          child: icon),
        Text(title, style: const TextStyle( fontSize: 15),),
        const Spacer(),
        Text(amount, style: const TextStyle(color: orangeRed, fontWeight: FontWeight.bold, fontSize: 15),),
        Text(unit, style: const TextStyle(color: orange, fontWeight: FontWeight.bold, fontSize: 15),)
      ],
    );
  }
}