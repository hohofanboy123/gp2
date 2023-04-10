import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/forgot_password/reset_password_data.dart';
import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';

abstract class ResetPasswordController extends GetxController {
  
  goToResetSuccess();
  goToSignIn();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController confPassword;

  String? email;
  bool showPass = true;

  void showPassword(){
    showPass = showPass == true ? false : true;
    update();
  }

  StatusRequest? statusRequest;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  goToResetSuccess() async {
    if(formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.offNamed(AppRoute.resetPasswordSuccess);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "ERROR");
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
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    confPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confPassword.dispose();
    super.dispose();
  }
}
