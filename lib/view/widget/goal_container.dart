import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/calories_controller.dart';

class GoalContainer extends StatelessWidget {
  final String text;
  final int index;
  const GoalContainer({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    ColoriesControllerImp controller = Get.put(ColoriesControllerImp());
    return 
      GestureDetector(
        onTap: () => controller.selectedGoal(index),
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 50,
            width: Get.width / 4,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: controller.selectedGoal.toInt() == index ? Border.all(color: Colors.black, width: 3) : Border.all(color: Colors.grey)
          ),
          child: 
            Center(
              child:
                Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
            ),
          ),
        ),
      );
  }
}