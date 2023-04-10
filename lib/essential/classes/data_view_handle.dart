import 'package:fexercise/essential/classes/status_request.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DataViewHandle extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const DataViewHandle({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 

      statusRequest == StatusRequest.loading            ? Center(child: Lottie.asset(ImageUse.loading, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),)
    : statusRequest == StatusRequest.connectionFailure  ? Center(child: Lottie.asset(ImageUse.noInternet, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),) 
    : statusRequest == StatusRequest.serverFailure      ? Center(child: Lottie.asset(ImageUse.serverError, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),) 
    : statusRequest == StatusRequest.taskFailure        ? Center(child: Lottie.asset(ImageUse.noData, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),) 
    : widget;
  }
}

class ReqViewHandle extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const ReqViewHandle({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 

      statusRequest == StatusRequest.loading            ? Center(child: Lottie.asset(ImageUse.loading, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),)
    : statusRequest == StatusRequest.connectionFailure  ? Center(child: Lottie.asset(ImageUse.noInternet, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),) 
    : statusRequest == StatusRequest.serverFailure      ? Center(child: Lottie.asset(ImageUse.serverError, width: Get.width * (500 / 375.0), height: Get.height * (500 / 812.0),),) 
    : widget;
  }
}