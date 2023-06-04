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
          controller.percent.value == 1.0 ? "Based on your allergies & illnesses this food is considered high risk" 
        : controller.percent.value == 0.66 ? "Based on your allergies & illnesses this food is considered medium risk" 
        : controller.percent.value == 0.33 ? "Based on your allergies & illnesses this food is considered low risk"
        : "Based on your allergies & illnesses this food is considered no risk",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.triangleExclamation, size: 15,),
            LinearPercentIndicator(
              barRadius: Radius.circular(30),
                                  padding: EdgeInsets.symmetric(horizontal: 0),
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