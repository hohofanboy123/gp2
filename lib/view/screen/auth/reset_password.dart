import 'package:fexercise/essential/classes/status_request.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/shared/custom_text_field.dart';
import 'package:fexercise/view/screen/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgot_password_controller/reset_password_controller.dart';
import '../../../essential/constants/global_constants.dart';
import '../../../essential/functions/validation.dart';

class ResetPassword extends StatelessWidget{
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Reset password"),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
      ),
      
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) =>
        controller.statusRequest == StatusRequest.loading?
        const Center(child: Text("LOADING...")):
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
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
                const Text(
                  "Create new password",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Your identity has been verified!\nset new password",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                //sign in vector art pic
                Image.asset(
                  ImageUse.resetPassword,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 30,),
                //password field
                CustomPasswordTextField(
                  visibilityOff : controller.showPass,
                      showPassword: () {
                        controller.showPassword();
                      },
                  cont: controller.password,
                  labelTxt: "New password",
                  hintTxt: "Enter your new password",
                  icon: Icons.key_outlined,
                  icon2: Icons.visibility_off,
                  validation: (val){
                      return validatePasswordInput(val!);
                    },
                ),
                const SizedBox(height: 20,),
                CustomPasswordTextField(
                  visibilityOff : controller.showPass,
                      showPassword: () {
                        controller.showPassword();
                      },
                  cont: controller.confPassword,
                  labelTxt: "Confirm new password",
                  hintTxt: "Enter your new password again",
                  icon: Icons.key_outlined,
                  icon2: Icons.visibility_off,
                  validation: (val){
                      return validatePasswordInput(val!);
                    },
                ),
                const SizedBox(height: 10,),
                //forgot password
                //Sign in button
                AuthButton(
                  text: "Reset password",
                  press: () {
                    controller.goToResetSuccess();
                  },
                ),
                const SizedBox(height: 10,),
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
