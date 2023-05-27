import 'package:fexercise/essential/shared/custom_inkwell.dart';
import 'package:fexercise/essential/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/sign_up_controller.dart';
import '../../../essential/classes/data_view_handle.dart';
import '../../../essential/constants/global_constants.dart';
import '../../../essential/functions/validation.dart';
import 'auth_button.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      //APP BAR SETTINGS
      appBar: AppBar(
        title: Text("13".tr),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
      ),
      body: GetBuilder<SignUpControllerImp>
      (builder: (controller) => ReqViewHandle(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formstate,
            child : SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    "25".tr,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "26".tr,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,),
                  //SIGN UP IMAGE
                  //Image.asset(
                  //  ImageUse.signUpImage,
                  //  height: 150,
                  //  width: 150,
                  //),
                  //FIRST NAME FIELD
                  CustomTextField(
                    cont: controller.fname,
                    labelTxt: "27".tr,
                    hintTxt: "28".tr,
                    icon: Icons.perm_identity_outlined,
                    validation: (val){
                        return validateName(val!);
                      },
                    ),
                  const SizedBox(height: 20,),
                  //LAST NAME FIELD
                  CustomTextField(
                    cont: controller.lname,
                    labelTxt: "29".tr,
                    hintTxt: "30".tr,
                    icon: Icons.perm_identity_outlined,
                    validation: (val){
                        return validateName(val!);
                      },
                    ),
                  const SizedBox(height: 20,),
                  //EMAIL FIELD
                  EmailCustomTextField(
                    labelTxt: "16".tr,
                    hintTxt: "17".tr,
                    cont: controller.email,
                    icon: Icons.email_outlined,
                    validation: (val){
                        return validateEmailInput(val!);
                      },
                  ),
                  const SizedBox(height: 20,),
                  //PASSWORD FIELD
                  GetBuilder<SignUpControllerImp>(
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
                  const SizedBox(height: 20,),
                  //SIGN UP BUTTON
                  AuthButton(
                    text: "13".tr,
                    press: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(height: 10,),
                  //ALREADY HAVE AN ACCOUNT?
                  CustomeInkWell(
                    textOne: "33".tr,
                    textTwo: "12".tr,
                    onTap: (){
                      controller.goToSignIn();
                    }
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