import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/shared/custom_inkwell.dart';
import 'package:fexercise/essential/shared/custom_text_field.dart';
import 'package:fexercise/view/screen/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgot_password_controller/check_email_controller.dart';
import '../../../essential/classes/status_request.dart';
import '../../../essential/constants/global_constants.dart';
import '../../../essential/functions/validation.dart';

class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("34".tr),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
      ),
      //Scroll view so when the keyboard pops out a render flow doesnt happen
      //and to allow the user to to scroll down while keyboard is open
        body: GetBuilder<CheckEmailControllerImp>(builder: (controller) => 
        controller.statusRequest == StatusRequest.loading ?
        const Center(
          child: Text("LOADING ...."),
        )
        :
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formstate,
          child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Column(
              children: [
                //top box text area
                Text(
                  "35".tr,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "36".tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                //sign in vector art pic
                Image.asset(
                  ImageUse.forgotPassword,
                  height: 400,
                  width: 400,
                ),
                const SizedBox(height: 10,),
                EmailCustomTextField(
                  labelTxt: "16".tr,
                  hintTxt: "17".tr,
                  icon: Icons.email_outlined,
                  cont: controller.email,
                  validation: (val){
                          return validateEmailInput(val!);
                        },
                ),
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: (){
                      controller.goToSignIn();
                    },
                    child: Text(
                        "37".tr,
                        textAlign: TextAlign.end,
                      ),
                  ),
                ),
                const SizedBox(height: 20,),
                //Sign in button
                AuthButton(
                  text: "38".tr,
                  press: () {
                    controller.goToOtpCode();
                  },
                ),
                const SizedBox(height: 10,),
                //sign up
                CustomeInkWell(
                  textOne: "21".tr,
                  textTwo: "13".tr,
                  onTap: (){
                    controller.goToSignUp();
                  },
                ),
              ]
            ),
          ),
          ),
        ),
      ),
      ),
    );
  }

}