import 'package:fexercise/controller/auth_controller/sign_in_controller.dart';
import 'package:fexercise/essential/classes/data_view_handle.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/functions/validation.dart';
import 'package:fexercise/essential/shared/custom_inkwell.dart';
import 'package:fexercise/essential/shared/custom_text_field.dart';
import 'package:fexercise/view/screen/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../essential/constants/global_constants.dart';

class SignIn extends StatelessWidget{
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("12".tr),
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
      body: GetBuilder<SignInControllerImp>
      (builder: (controller) => ReqViewHandle(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
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
                  "14".tr,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "15".tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                //sign in vector art pic
                Image.asset(
                  ImageUse.signInImage,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 30,),
                //email field
                EmailCustomTextField(
                  validation: (val){
                    return validateEmailInput(val!);
                  },
                  labelTxt: "16".tr,
                  hintTxt: "17".tr,
                  icon: Icons.email_outlined,
                  cont: controller.email,
                ),
                const SizedBox(height: 20,),
                //password field
                GetBuilder<SignInControllerImp>(
                  builder: (controller) => CustomPasswordTextField(
                      visibilityOff : controller.showPass,
                      showPassword: () {
                        controller.showPassword();
                      },
                      cont: controller.password,
                      labelTxt: "18".tr,
                      hintTxt: "19".tr,
                      icon: Icons.lock_outline,
                      icon2: Icons.visibility_off_outlined,
                      validation: (val){
                        return validatePasswordInput(val!);
                      },
                    ),
                ),
                const SizedBox(height: 10,),
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children : [
                    InkWell(
                    onTap: (){
                      controller.goToForgotPassword();
                    },
                    child: Text(
                        "20".tr,
                        textAlign: TextAlign.end,
                      ),
                  ),
                  ],
                ),
                //Sign in button
                AuthButton(
                  text: "12".tr,
                  press: () {
                    controller.signIn();
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
      ),
    );
  }

  }