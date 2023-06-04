import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/auth/sign_up_crud.dart';
import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';

abstract class SignInController extends GetxController {

  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignInController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController fname;
  late TextEditingController lname;
  late TextEditingController email;
  late TextEditingController password;

  bool showPass = true;

  void showPassword(){
    showPass = showPass == true ? false : true;
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  @override
  signUp() async {
    if(formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(fname.text, lname.text, email.text, password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.offNamed(AppRoute.signUpCode, arguments: {
            "email" : email.text,
            });
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "EMAIL ALREADY EXISTS");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    fname = TextEditingController();
    lname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}