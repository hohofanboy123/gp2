import 'package:fexercise/controller/auth_controller/sign_in_controller.dart';
import 'package:fexercise/essential/classes/data_view_handle.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/functions/validation.dart';
import 'package:fexercise/essential/shared/custom_inkwell.dart';
import 'package:fexercise/essential/shared/custom_text_field.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        title: Text("SignIn".tr),
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
                  "welcomeBack".tr,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "SignInDesc".tr,
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
                  labelTxt: "email".tr,
                  hintTxt: "enterEmail".tr,
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
                      labelTxt: "pass".tr,
                      hintTxt: "enterPass".tr,
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
                        "forgotPass".tr,
                        textAlign: TextAlign.end,
                      ),
                  ),
                  ],
                ),
                //Sign in button
                CustomButton(
                  text: "SignIn".tr,
                  press: () {
                    controller.signIn();
                  },
                ),
                const SizedBox(height: 10,),
                //sign up
                CustomeInkWell(
                  textOne: "noAcc".tr,
                  textTwo: "SignUp".tr,
                  onTap: (){
                    controller.goToSignUp();
                  },
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 2.5, endIndent: 5,)),
                    Text("OR"),
                    Expanded(child: Divider(thickness: 2.5, indent: 5,)),
                  ],
                ),
                IconButton(
                  onPressed: (){
                    controller.googleSignIn();
                  },
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.blue,)
                )
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