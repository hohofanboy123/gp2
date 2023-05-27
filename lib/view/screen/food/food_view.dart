import "package:fexercise/data/model/food_model.dart";
import "package:fexercise/essential/classes/data_view_handle.dart";
import 'package:fexercise/view/screen/food/food_list.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../controller/food_controller.dart";

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodControllerImp());
    return GetBuilder<FoodControllerImp>(
              builder: (controller) => DataViewHandle(
                statusRequest: controller.statusRequest,
                widget:
      Scaffold(
      body: 
          ListView(
            children: const[
              FoodList(),
            ],
          ),
      )));
  }
}