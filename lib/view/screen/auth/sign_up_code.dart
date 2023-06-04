import 'package:fexercise/essential/classes/status_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/code_verify_controller.dart';
import '../../../essential/constants/global_constants.dart';
import '../../../essential/constants/image_use.dart';
import '../../../essential/shared/custom_inkwell.dart';


class VerifySignUpOtp extends StatelessWidget{
  const VerifySignUpOtp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyOtpCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("OTP verification"),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
      ),

      body: GetBuilder<VerifyOtpCodeControllerImp>
      (builder: (controller) => controller.statusRequest == StatusRequest.loading ?
        const Center(
          child: Text("LOADING..."),
        )
        :
        SingleChildScrollView(
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
                "OTP",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Enter the OTP sent to your email",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              OtpTextField(
                numberOfFields: 4,
                fieldWidth: 60,
                cursorColor: orange,
                autoFocus: true,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                focusedBorderColor: orange,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false, 
                //runs when a code is typed in
                onCodeChanged: (String code) {
                //handle validation or checks here           
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToAccCreated(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(height: 10,),
              CustomeInkWell(
                textOne: "41".tr,
                textTwo: "42".tr,
                onTap: (){
                  //controller.goToResetPassword();
                },
              ),
              //sign in vector art pic
              Image.asset(
                ImageUse.otpCode,
                height: 400,
                width: 400,
              ),
              //Sign in button
              //sign up
            ],
          ),
        ),
        ),
      ),
      ),
    );
  }

}

