import 'dart:developer';

import 'package:fexercise/essential/constants/route_name.dart';
import 'package:fexercise/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../essential/getxservices/services.dart';

abstract class MultiScreenController extends GetxController{

  changePage(int index);
  goToExercise();
  goToFoodList();
  goToCalories();

}

class MultiScreenControllerImp extends MultiScreenController{

  Services services = Get.find();

  String? name;
  String? gender;

  int currPage = 0;
  var selectedOption = "A".obs;

  List<Widget> listPage = [
    const Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children : const [Center(child: Text("FAVORITS"),)]
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children : const [Center(child: Text("PROFILE"),)]
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children : const [Center(child: Text("SETTINGS"),)]
    ),
  ];

  @override
  changePage(int index) {
    currPage = index;
    update();
  }
  
  @override
  goToExercise() {
    Get.toNamed(AppRoute.mainExercise);
  }
  
  @override
  goToFoodList() {
    Get.toNamed(AppRoute.foodList);
  }

  @override
  goToCalories() {
    gender == "null" ? Get.toNamed(AppRoute.bodyAnthropometry) : Get.toNamed(AppRoute.foodList);
  }

  @override
  void onInit() {
    name = services.sharedPreferences.getString("fname");
    gender = services.sharedPreferences.getString("gender");
    super.onInit();
  }
  


}