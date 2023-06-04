import 'package:fexercise/controller/multiscreen_controller.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../essential/shared/container.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    MultiScreenControllerImp controller = Get.put(MultiScreenControllerImp());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          HomeContainer(
            image: ImageUse.calories,
            title: "calories".tr,
            text: "trackCalories".tr,
            color: const Color(0XFF769AB8),
            onTap: () {
              controller.goToCalories();
              },
          ),
          HomeContainer(
            image: ImageUse.exercises,
            title: "exercises".tr,
            text: "exercisesDesc".tr,
            color: const Color(0XFFE87E91),
            onTap: () {
              controller.goToExercise();
              },
          ),
          HomeContainer(
            image: ImageUse.diets,
            title: "nutrition".tr,
            text: "nutritionDesc".tr,
            color: const Color(0XFFF3CCA2),
            onTap: () {
              controller.goToFoodList();
              },
          ),
          HomeContainer(
            image: ImageUse.posts,
            title: "feed".tr,
            text: "feedDesc".tr,
            color: const Color(0XFF9FBB9B),
            onTap: () {
              controller.goToFeed();
              },
          ),
        ],
      ),
    );
  }
}
 /*SizedBox(
        width: Get.width * (300 / 375.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 156,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: blue1,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: Colors.grey,
                  )
                ]
              ),
            ),
            SvgPicture.asset(
              ImageUse.cat1,
              width: Get.width * (150 / 375.0),
              height: Get.height * (150 / 812.0),
            ),
            Positioned(
              left: 156,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15,
                ),
                height: 156,
                width: Get.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Calories",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Track your calories and keep up with your daily goal!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    )
                  ],
                  ),
              ),
              ),
          ],
        ),
        
        ),*/