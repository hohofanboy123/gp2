import 'package:fexercise/data/datasource/remote/exercise_detail_data.dart';
import 'package:fexercise/data/datasource/remote/food_data.dart';
import 'package:fexercise/data/model/food_model.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';

abstract class FoodController extends GetxController{

getFoodData();
goToFoodDetail(FoodModel foodModel);

}

class FoodControllerImp extends FoodController{

FoodData foodData = FoodData(Get.find());
List food = [];

late StatusRequest statusRequest;

@override
  void onInit() {
    getFoodData();
    super.onInit();
  }

@override
getFoodData() async {
    statusRequest = StatusRequest.loading;
      var response = await foodData.getData();
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          food.addAll(response['data']);
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
  goToFoodDetail(foodModel) {
    Get.toNamed(AppRoute.foodDetail, arguments: {
      "foodModel": foodModel
    });
  } 

}