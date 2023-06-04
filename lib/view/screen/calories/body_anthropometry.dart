import 'package:fexercise/view/screen/calories/gender_picker.dart';
import 'package:fexercise/view/widget/allergy_illness_select.dart';
import 'package:fexercise/view/widget/calories_nutrients_progress.dart';
import 'package:fexercise/view/widget/divider.dart';
import 'package:fexercise/view/widget/goal_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../controller/calories_controller.dart';
import '../../widget/activity_container.dart';


class BodyAnthropometry extends StatelessWidget {
  const BodyAnthropometry({super.key});
  @override
  Widget build(BuildContext context) {
    ColoriesControllerImp controller = Get.put(ColoriesControllerImp());
    return Scaffold(
      body: Container(
        height: Get.height,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Obx(
                  () => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                            children: [
                              SizedBox(height: 50,),
                              const CustomDivider(text: "Your goal"),
                              const Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children : [
                                  GoalContainer(
                                    text: "Gain Weight",
                                    index: 1,
                                  ),
                                  GoalContainer(
                                    text: "Maintain Weight",
                                    index: 2,
                                  ),
                                  GoalContainer(
                                    text: "Lose Weight",
                                    index: 3,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              const CustomDivider(text: "Body Anthropometry"),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GenderPicker(
                    icon: FaIcon(FontAwesomeIcons.mars, color: Colors.blue, size: 60,),
                    gender: "Male",
                    val: true,
                                  ),
                                  GenderPicker(
                    icon: FaIcon(FontAwesomeIcons.venus, color: Colors.pink, size: 60,),
                    gender: "Female",
                    val: false,
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 7.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                    color: Colors.grey
                                  )
                                ),
                                child: Column(
                                  children: [
                    const Text(
                          "Height (in cm)",
                        ),
                    NumberPicker(
                    minValue: 120,
                    maxValue: 220,
                    value: controller.height.value,
                    selectedTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
                    textStyle: const TextStyle(color: Colors.black54, fontSize: 11),
                    axis: Axis.horizontal,
                    itemCount: 7,
                    itemWidth: 45,
                    onChanged: (heightValue) {
                      controller.setHeight(heightValue);
                    },
                        ),
                    Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: List.generate(
                                13,
                                (index) => Container(
                                  margin:const EdgeInsets.symmetric(horizontal: 10,),
                                  height: index == 6 ? 40 : index % 2 == 0 ? 20 : 15,
                                  width: 2,
                                  color: index == 6 ? Colors.black : Colors.black54,
                    )
                                ),
                              )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 7.5),
                    height: 190,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                      "Weight (in kg)",
                    ),
                    Container(
                      height: 80,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.withOpacity(0.18),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          const Positioned(
                            top: -10,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                              Center(
                                child:NumberPicker(
                    minValue: 30,
                    maxValue: 200,
                    value: controller.weight.value,
                    itemWidth: 41,
                    selectedTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                    ),
                    textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                    ),
                    axis: Axis.horizontal,
                    onChanged: (weightValue) {
                      controller.setWeight(weightValue);
                    },
                                  ),
                                ),
                            ],
                      ),
                    ),
                      ],
                    ),
                  
                                  ),
                                  Container(
                    height: 190,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                                  ),
                                  child: Center(
                    child: IconButton(
                      onPressed: () {controller.ageDec();},
                      icon: const Icon(Icons.remove, color: Colors.red,),
                      iconSize: 25,
                      ),
                                  ),
                                ),
                              Text(
                                  '${controller.age.value}',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 3),
                                  ),
                                  child: Center(
                    child: IconButton(
                      onPressed: () {controller.ageInc();},
                      icon: const Icon(Icons.add, color: Colors.green,),
                      iconSize: 25,
                      ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              const CustomDivider(text: "Daily activity level"),
                              const ActivityContainer(
                                text: "Sedentary (little to no exercise)",
                                index: 1,
                              ),
                              const ActivityContainer(
                                text: "Lightly active (light exercise or sports 1-3 days a week)",
                                index: 2,
                              ),
                              const ActivityContainer(
                                text: "Moderately active (moderate exercise orsports 3-5 days a week)",
                                index: 3,
                              ),
                              const ActivityContainer(
                                text: "Very active (hard exercise or sp67orts 6-7 days a week)",
                                index: 4,
                              ),
                              const ActivityContainer(
                                text: "Extra active (very hard exercise or a physically demanding job)",
                                index: 5,
                              ),
                              SizedBox(height: 20,),
                              CustomDivider(text: "Allergy & Illness"),
                              const Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 20,
                                children : [
                              AllergyContainer(
                                text: "Type 2 Diabetes",
                                index: 1,
                              ),
                              AllergyContainer(
                                text: "Hypertension",
                                index: 2,
                              ),
                              AllergyContainer(
                                text: "Celiac Disease",
                                index: 3,
                              ),
                              AllergyContainer(
                                text: "Wheat Allergy",
                                index: 4,
                              ),
                              AllergyContainer(
                                text: "Milk Allergy",
                                index: 5,
                              ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.updateData();
                                },
                                 child: Text('Get Weight and Height'),
),
                            ],
                          ),
                  ),
      ),
    )
    );
  }
}
