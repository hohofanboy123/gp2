import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'essential/getxservices/services.dart';

class MiddleWare extends GetMiddleware{

  @override
  int? get priority => 1;

  Services services = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(services.sharedPreferences.getString("check") == "1")
    {
      return const RouteSettings(name: AppRoute.signIn);
    }
    return null;
  }

}