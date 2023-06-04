import 'package:fexercise/data/datasource/remote/bowl_data.dart';
import 'package:fexercise/data/model/food_model.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasource/remote/add_food_data.dart';
import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';
import '../essential/getxservices/services.dart';

abstract class FoodDetailController extends GetxController{

  addToBowl();
  goToBowl();
  foodRisk();

}

class FoodDetailControllerImp extends FoodDetailController{

  AddFoodData addFoodData = AddFoodData(Get.find());

  List bowl = [];
  int? id;
  int? kcal;
  int? carbs;
  int? fats;
  int? protein;
  
  double? foodrisk;

  final percent = RxDouble(0.0);

  Services services = Get.find();

  late StatusRequest statusRequest;

  late FoodModel foodModel;

  late TextEditingController quantity;

  @override
  void onInit() {
    quantity = TextEditingController();
    foodModel = Get.arguments['foodModel'];
    id = services.sharedPreferences.getInt("id");
    foodRisk();
    super.onInit();
  }
  
  @override
  addToBowl() async {
    kcal = (foodModel.kcal!.toDouble()*int.parse(quantity.text)).toInt();
    carbs = (foodModel.carbs!.toDouble()*int.parse(quantity.text)).toInt();
    fats = (foodModel.fats!.toDouble()*int.parse(quantity.text)).toInt();
    protein = (foodModel.protein!.toDouble()*int.parse(quantity.text)).toInt();
    statusRequest = StatusRequest.loading;
      var response = await addFoodData.postData(
        id.toString(),
        foodModel.foodId.toString(),
        quantity.text,
        kcal.toString(),
        carbs.toString(),
        fats.toString(),
        protein.toString(),
      );
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.defaultDialog(middleText: "ADDED");
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }

      update();
  }

  @override
  foodRisk() async{
      var response = await addFoodData.getRisk(id!.toString(), foodModel.foodId.toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          var data = response['data'];
          if (data != null && data is List && data.isNotEmpty) {
            percent.value = (data[0]['highest_risk'] ?? 0).toDouble();
          } else {
        // Handle case when data is empty or not in the expected format
            percent.value = 0;
          }
        } else {
      // Handle case when response status is not "success"
      percent.value = 0;
    }
    update();
  }
  //print(foodrisk);
  }

  @override
  void dispose() {
    quantity.dispose();
    super.dispose();
  }
  
  @override
  goToBowl() {
    Get.toNamed(AppRoute.bowl);
  }
  
  

}