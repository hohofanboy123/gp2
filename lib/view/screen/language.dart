import 'package:fexercise/essential/constants/image_use.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:fexercise/essential/localization/change_lang.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LanguageController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageUse.languageImage,
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 30,),
            Text(
              "1".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
              ),
              ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: CustomButton(text: "2".tr, press: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.welcome);
              }),
            ),
             SizedBox(
              width: double.infinity,
              child: CustomButton(text: "3".tr, press: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.welcome);
              }),
            )
          ],
        ),
      ),
    );
  }
  
}