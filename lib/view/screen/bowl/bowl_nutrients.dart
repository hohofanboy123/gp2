import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BowlNutrients extends StatelessWidget {
  final String nutrient;
  final FaIcon icon;
  const BowlNutrients({super.key, required this.nutrient, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
                      children: [
                        icon,
                        const SizedBox(width: 5,),
                        Text(nutrient),
                      ],
                    );
  }
}