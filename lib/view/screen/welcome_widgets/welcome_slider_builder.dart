import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/welcome_controller.dart';
import '../../../data/datasource/static/static.dart';

class WelcomeSliderBuilder extends GetView<WelcomeControllerImp> {
  const WelcomeSliderBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: welcomeModelList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height * (20 / 812.0),
            ),
            child: Text(
              textAlign: TextAlign.center,
              welcomeModelList[i].title!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
            
          SizedBox(height: Get.height * (50 / 812.0),),
            
          Image.asset(
            welcomeModelList[i].image!,
            height: Get.height * (250 / 812.0),
            width: Get.width * (250 / 375.0),
            fit: BoxFit.fill,
          ),

          SizedBox(height: Get.height * (30 / 812.0),),
            
          Text(
            textAlign: TextAlign.center,
            welcomeModelList[i].body!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}