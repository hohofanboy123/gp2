import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/auth/sign_in_data.dart';
import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';
import '../../essential/getxservices/services.dart';

abstract class SignInController extends GetxController {

  signIn();
  goToSignUp();
  goToForgotPassword();
}

class SignInControllerImp extends SignInController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  Services services = Get.find();

  bool showPass = true;

  void showPassword(){
    showPass = showPass == true ? false : true;
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  SignInData signInData = SignInData(Get.find());

  @override
  signIn() async {
    if(formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          services.sharedPreferences.setInt("id", response['data']['user_id']);
          services.sharedPreferences.setString("fname", response['data']['fname']);
          services.sharedPreferences.setString("lname", response['data']['lname']);
          services.sharedPreferences.setString("email", response['data']['email']);
          services.sharedPreferences.setString("gender", response['data']['gender'].toString());
          Get.offNamed(AppRoute.multiscreen);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
    }
    else
    {
      
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  
  @override
  goToForgotPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}