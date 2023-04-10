import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/forgot_password/check_email_data.dart';
import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';

abstract class CheckEmailController extends GetxController {

  goToOtpCode();
  goToSignUp();
  goToSignIn();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
}

class CheckEmailControllerImp extends CheckEmailController {

  late TextEditingController email;
  StatusRequest? statusRequest;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  goToOtpCode() async {
    if(formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.offNamed(AppRoute.passCodeVerify, arguments: {"email" : email.text});
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL");
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
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  

  
}