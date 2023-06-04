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
                        builder: (controller) => DataViewHandle(
                          statusRequest: controller.statusRequest,
                          widget: Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
                                height: Get.height/2.3,
                                width: Get.width,
                                color: blue3,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.utensils, color: Colors.orange,),
                                            Text("208", style: TextStyle(fontSize: 25,color: Colors.white,),),
                                            Text("EATEN", style: TextStyle(fontSize: 10,color: Colors.white,),)
                                          ],
                                        ),
                                        CircularPercentIndicator(
                                          linearGradient: gradientColor2,
                                          radius: Get.width / 4.5,
                                          percent: controller.consumedKcal/controller.tdee > 1 ? 1 : controller.consumedKcal/controller.tdee,
                                          lineWidth: 15,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          backgroundColor: orange.withOpacity(0.3),
                                          animation: true,
                                          animationDuration: 1000,
                                          animateFromLastPercent: true,
                                          center: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(),
                                              children: [
                                                TextSpan(text: controller.consumedKcal.toString(), style: TextStyle(color: Colors.white, fontSize: 30,)),
                                                TextSpan(text: "\n/${controller.tdee}", style: TextStyle(color: Colors.grey))
                                              ]
                                            )
                                            ),
                                          ),
                                          Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.fire, color: Colors.red,),
                                            Text("0", style: TextStyle(fontSize: 25,color: Colors.white,),),
                                            Text("BURNT", style: TextStyle(fontSize: 10, color: Colors.white,),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        DailyMacros(
                                          color: Colors.green,
                                          name: "Carbs",
                                          amount: controller.consumedCarbs.toString()//controller.consumedCarbs.toString(),
                                        ),
                                        DailyMacros(
                                          color: Colors.red,
                                          name: "Fats",
                                          amount: controller.consumedFats.toString()//controller.consumedCarbs.toString(),
                                        ),
                                        DailyMacros(
                                          color: Colors.orange,
                                          name: "Proten",
                                          amount: controller.consumedProtein.toString()//controller.consumedCarbs.toString(),
                                        ),
                                      ],
                                    )
                                  ],
                              )
                            ),
          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Text("Monday 21st", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        FaIcon(FontAwesomeIcons.calendar)
                      ],),
                Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height / 2,
      child:
                            FoodHistory(),
                        ),
                      ]),
                      ),
      ),
      );
  }
}