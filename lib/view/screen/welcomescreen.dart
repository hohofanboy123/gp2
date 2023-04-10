import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/welcome_controller.dart';
import 'welcome_widgets/custom_button.dart';
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
                  CustomButton(
                    text: "12".tr,
                    press: (){
                      controller.goToSignIn();
                    },
                  ),
                  CustomButton(
                    text: "13".tr,
                    press: (){
                      controller.goToSignUp();
                    },
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

