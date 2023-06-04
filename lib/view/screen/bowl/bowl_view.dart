import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/screen/bowl/bowl_list.dart';
import 'package:fexercise/view/screen/bowl/bowl_summary.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/bowl_controller.dart';
import '../../../essential/classes/data_view_handle.dart';

class BowlView extends StatelessWidget {
  const BowlView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BowlControllerImp());
    return GetBuilder<BowlControllerImp>(
              builder: (controller) => DataViewHandle(
                statusRequest: controller.statusRequest,
                widget: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 1.5,
            child: const BowlList()
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: Get.height / 5,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: blue2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("summary".tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 20,),
                BowlSummary(
                  icon: const FaIcon(FontAwesomeIcons.fire, size: 15, color: Colors.red,),
                  title: "totalCalories".tr,
                  amount: controller.consumedKcal.toString(),
                  unit: "kcal2".tr,
                ),
                const Divider(),
                BowlSummary(
                  icon: const FaIcon(FontAwesomeIcons.breadSlice, size: 15, color: Colors.green,),
                  title: "totalCarbohydrates".tr,
                  amount: controller.consumedCarbs.toString(),
                  unit: "unit".tr,
                ),
                const Divider(height: 3,),
                BowlSummary(
                  icon: const FaIcon(FontAwesomeIcons.bacon, size: 15, color: Colors.red,),
                  title: "totalFats".tr,
                  amount: controller.consumedFats.toString(),
                  unit: "unit".tr,
                ),
                const Divider(height: 3,),
                BowlSummary(
                  icon: const FaIcon(FontAwesomeIcons.drumstickBite, size: 15, color: Colors.orange,),
                  title: "totalProtein".tr,
                  amount: controller.consumedProtein.toString(),
                  unit: "unit".tr,
                ),
              ],
            ),
          ),
          CustomButton(
            text: "eat".tr,
            press: (){
              controller.addToFoodHistory();
            }
          )
        ],
      ),
                ),
              ),
    );
  }
}