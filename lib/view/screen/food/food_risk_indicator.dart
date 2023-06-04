import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/food_detail_controller.dart';

class RiskIndicator extends StatelessWidget {
  const RiskIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    FoodDetailControllerImp controller = Get.put(FoodDetailControllerImp());
    return Obx(() =>Column(
      children: [
        Text(
          controller.percent.value == 1.0 ? "highRisk" .tr
        : controller.percent.value == 0.66 ? "medRisk".tr 
        : controller.percent.value == 0.33 ? "lowRisk".tr
        : "noRisk".tr,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.triangleExclamation, size: 15,),
            LinearPercentIndicator(
              barRadius: const Radius.circular(30),
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  animation: true,
                                  width: Get.width / 2,
                                  progressColor: 
                                    controller.percent.value == 1.0 ? Colors.red 
                                  : controller.percent.value == 0.66 ? Colors.orange 
                                  : controller.percent.value == 0.33 ? Colors.yellow 
                                  : Colors.green,
                                  backgroundColor:
                                    controller.percent.value == 1.0 ? Colors.red.withOpacity(0.5) 
                                  : controller.percent.value == 0.66 ? Colors.orange.withOpacity(0.5) 
                                  : controller.percent.value == 0.33 ? Colors.yellow.withOpacity(0.5)
                                  : Colors.green.withOpacity(0.5),
                                  percent: controller.percent.value,
                                ),
          ],
        ),
      ],
    ),
                        );
  }
}