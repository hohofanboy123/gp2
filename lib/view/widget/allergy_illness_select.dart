import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/calories_controller.dart';

class AllergyContainer extends StatelessWidget {
  final String text;
  final int index;

  const AllergyContainer({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColoriesControllerImp controller = Get.put(ColoriesControllerImp());
    return  GestureDetector(
          onTap: () => controller.toggleSelectedAllergy(index),
          child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: Get.height/ 15,
            width: Get.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: controller.isSelectedAllergy(index)
                  ? Border.all(color: Colors.black, width: 3)
                  : Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ),
        );
  }
}
