import 'package:fexercise/data/model/welcomemodel.dart';
import 'package:get/get.dart';

import '../../../essential/constants/image_use.dart';

List<WelcomeModel> welcomeModelList = [

  WelcomeModel(
    title: "welcome".tr,
    image: ImageUse.welcomeImageOne,
    body: "buildlifestyle".tr,
  ),

  WelcomeModel(
    title: "trackFood".tr,
    image: ImageUse.welcomeImageTwo,
    body: "trackFoodDesc".tr,
  ),

  WelcomeModel(
    title: "workoutAnywhere".tr,
    image: ImageUse.welcomeImageThree,
    body: "workoutAnywhereDesc".tr,
  ),

  WelcomeModel(
    title: "shareExp".tr,
    image: ImageUse.welcomeImageFour,
    body: "shareExpDesc".tr,
  ),
];