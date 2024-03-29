import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/screen/welcome_widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/welcome_controller.dart';
import 'welcome_widgets/dot_builder.dart';
import 'welcome_widgets/welcome_slider_builder.dart';



class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    WelcomeControllerImp controller =  Get.put(WelcomeControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: WelcomeSliderBuilder(),
            ),
            Expanded(
              child: Column(
                children: [
                  const DotBuilder(),
                  SizedBox(height: Get.height * (20 / 375.0)),
                  RaisedGradientButton(
                    gradient: gradientColor,
                    press: (){
                      controller.goToSignIn();
                    },
                    child: Text("SignIn".tr, style: TextStyle(
            fontSize: Get.width * (20 / 375.0),//SizeConfig.scrnWidth! * (25 / 375.0),
            color: Colors.white,
          ),)
                  ),
                  SizedBox(height: Get.height * (5 / 375.0)),
                  RaisedGradientButton(
                    gradient: gradientColor,
                    press: (){
                      controller.goToSignUp();
                    },
                    child: Text("SignUp".tr, style: TextStyle(
            fontSize: Get.width * (20 / 375.0),//SizeConfig.scrnWidth! * (25 / 375.0),
            color: Colors.white,
          ),)
                  ),
                  const Spacer(flex: 1,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

