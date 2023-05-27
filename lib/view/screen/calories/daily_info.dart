import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/essential/functions/clipper.dart';
import 'package:fexercise/view/widget/macros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyInfo extends StatelessWidget {
  const DailyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
                                height: Get.height/2.5,
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
                                            Text("934", style: TextStyle(fontSize: 25,color: Colors.white,),),
                                            Text("EATEN", style: TextStyle(fontSize: 10,color: Colors.white,),)
                                          ],
                                        ),
                                        CircularPercentIndicator(
                                          linearGradient: gradientColor,
                                          radius: Get.width / 4.5,
                                          percent: 0.8,
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
                                                TextSpan(text: "1500", style: TextStyle(color: Colors.white, fontSize: 30,)),
                                                TextSpan(text: "\n/3000", style: TextStyle(color: Colors.grey))
                                              ]
                                            )
                                            ),
                                          ),
                                          Column(
                                          children: [
                                            FaIcon(FontAwesomeIcons.fire, color: Colors.red,),
                                            Text("934", style: TextStyle(fontSize: 25,color: Colors.white,),),
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
                                          amount: "110g",
                                        ),
                                        DailyMacros(
                                          color: Colors.red,
                                          name: "Fats",
                                          amount: "110g",
                                        ),
                                        DailyMacros(
                                          color: Colors.orange,
                                          name: "Proten",
                                          amount: "110g",
                                        ),
                                      ],
                                    )
                                  ],
                              )
                            ),
          ),
          Container(color: Colors.amber,height: Get.height /1.67,)
        ],
      ),
      );
  }
}