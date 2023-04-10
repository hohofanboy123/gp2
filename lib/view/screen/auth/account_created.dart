import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../essential/constants/global_constants.dart';
import 'auth_button.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    //SignInControllerImp controller =  Get.put(SignInControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pass Change success"),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                "Success!",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Password changed Successfully",
                textAlign: TextAlign.center,
              ),
              Lottie.asset(
                ImageUse.accountCreated,
                repeat: false,
                height: 300,
                width: 300,
              ),
              //sign in vector art pic
              const SizedBox(height: 30,),
              AuthButton(
                text: "Continue",
                press: () {
                  Get.offNamed(AppRoute.signIn);
                },
              ),
            ]
          ),
        ),
        ),
      ),
    );
  }
}