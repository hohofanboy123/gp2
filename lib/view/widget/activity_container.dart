import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/calories_controller.dart';

class ActivityContainer extends StatelessWidget {
  final String text;
  final int index;
  const ActivityContainer({super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    ColoriesControllerImp controller = Get.put(ColoriesControllerImp());
    return 
      GestureDetector(
        onTap: () => controller.selectedActivity(index),
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 50,
            width: Get.width,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: controller.selectedActivity.toInt() == index ? Border.all(color: Colors.black, width: 3) : Border.all(color: Colors.grey)
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