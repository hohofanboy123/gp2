import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/essential/functions/clipper.dart';
import 'package:fexercise/view/screen/food/food_history.dart';
import 'package:fexercise/view/widget/macros.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';


import '../../../controller/daily_info_controller.dart';
import '../../../essential/classes/data_view_handle.dart';

class DailyInfo extends StatelessWidget {
  const DailyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DailyInfoControllerImp());
    return GetBuilder<DailyInfoControllerImp>(
                        builder: (controller) =>  Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
                                height: Get.height/2.3,
                                width: Get.width,
                                color: blue3,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.utensils, color: Colors.orange,),
                                            Text("208", style: TextStyle(fontSize: 25,color: Colors.white,),),
                                            Text("EATEN", style: TextStyle(fontSize: 10,color: Colors.white,),)
                                          ],
                                        ),
                                        CircularPercentIndicator(
                                          linearGradient: gradientColor2,
                                          radius: Get.width / 4.5,
                                          percent: controller.consumedKcal == 0 ? 0.00001 : controller.consumedKcal/controller.tdee > 1 ? 1 : controller.consumedKcal/controller.tdee,
                                          lineWidth: 15,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          backgroundColor: orange.withOpacity(0.3),
                                          animation: true,
                                          animationDuration: 1000,
                                          animateFromLastPercent: true,
                                          center: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: const TextStyle(),
                                              children: [
                                                TextSpan(text: controller.consumedKcal.toString(), style: const TextStyle(color: Colors.white, fontSize: 30,)),
                                                TextSpan(text: "\n/${controller.tdee}", style: const TextStyle(color: Colors.grey))
                                              ]
                                            )
                                            ),
                                          ),
                                          const Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.fire, color: Colors.red,),
                                            Text("0", style: TextStyle(fontSize: 25,color: Colors.white,),),
                                            Text("BURNT", style: TextStyle(fontSize: 10, color: Colors.white,),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DailyMacros(
                                          color: Colors.green,
                                          name: "carbs".tr,
                                          amount: controller.consumedCarbs.toString(),//controller.consumedCarbs.toString(),
                                          percent: controller.consumedCarbs == 0 ? 0.00001 : controller.consumedCarbs/controller.carbsDaily > 1 ? 1 : controller.consumedCarbs/controller.carbsDaily,
                                        ),
                                        DailyMacros(
                                          color: Colors.red,
                                          name: "fats".tr,
                                          amount: controller.consumedFats.toString(),//controller.consumedCarbs.toString(),
                                          percent: controller.consumedFats == 0 ? 0.00001 : controller.consumedFats/controller.fatsDaily > 1 ? 1 : controller.consumedFats/controller.fatsDaily,
                                        ),
                                        DailyMacros(
                                          color: Colors.orange,
                                          name: "protein".tr,
                                          amount: controller.consumedProtein.toString(),//controller.consumedCarbs.toString(),
                                          percent: controller.consumedProtein == 0 ? 0.00001 : controller.consumedProtein/controller.proteinDaily > 1 ? 1 : controller.consumedProtein/controller.proteinDaily,
                                        ),
                                      ],
                                    )
                                  ],
                              )
                            ),
          ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Text("Monday 21st", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        FaIcon(FontAwesomeIcons.calendar)
                      ],),
                Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height / 2,
      
      child: GetBuilder<DailyInfoControllerImp>(
                        builder: (controller) => ReqViewHandle(
                          statusRequest: controller.statusRequest,
                          widget: 
                            const FoodHistory(),
                        ),
                        ))]),
                      ),
      );
  }
}