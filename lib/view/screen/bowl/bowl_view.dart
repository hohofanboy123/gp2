import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/screen/bowl/bowl_list.dart';
import 'package:fexercise/view/screen/bowl/bowl_summary.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
          Container(
            height: Get.height / 1.5,
            child: BowlList()
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: Get.height / 5,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: blue2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bowl summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                SizedBox(height: 20,),
                BowlSummary(
                  icon: FaIcon(FontAwesomeIcons.fire, size: 15, color: Colors.red,),
                  title: "Total Calories",
                  amount: controller.consumedKcal.toString(),
                  unit: " Kcal",
                ),
                Divider(),
                BowlSummary(
                  icon: FaIcon(FontAwesomeIcons.breadSlice, size: 15, color: Colors.green,),
                  title: "Total Carbohydrates",
                  amount: controller.consumedCarbs.toString(),
                  unit: " g",
                ),
                Divider(height: 3,),
                BowlSummary(
                  icon: FaIcon(FontAwesomeIcons.bacon, size: 15, color: Colors.red,),
                  title: "Total Fats",
                  amount: controller.consumedFats.toString(),
                  unit: " g",
                ),
                Divider(height: 3,),
                BowlSummary(
                  icon: FaIcon(FontAwesomeIcons.drumstickBite, size: 15, color: Colors.orange,),
                  title: "Total Protein",
                  amount: controller.consumedProtein.toString(),
                  unit: " g",
                ),
              ],
            ),
          ),
          CustomButton(
            text: "text",
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