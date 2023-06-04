import 'package:fexercise/view/screen/calories/gender_picker.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:fexercise/view/widget/allergy_illness_select.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(
                  () => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                            children: [
                              const SizedBox(height: 50,),
                              CustomDivider(text: "goal".tr),
                              Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children : [
                                  GoalContainer(
                                    text: "gain".tr,
                                    index: 1,
                                  ),
                                  GoalContainer(
                                    text: "maintain".tr,
                                    index: 2,
                                  ),
                                  GoalContainer(
                                    text: "lose".tr,
                                    index: 3,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              CustomDivider(text: "anthropometry".tr),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GenderPicker(
                    icon: const FaIcon(FontAwesomeIcons.mars, color: Colors.blue, size: 60,),
                    gender: "male".tr,
                    val: true,
                                  ),
                                  GenderPicker(
                    icon: const FaIcon(FontAwesomeIcons.venus, color: Colors.pink, size: 60,),
                    gender: "female".tr,
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
                    Text(
                          "height".tr,
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
                                    margin: const EdgeInsets.symmetric(vertical: 7.5),
                    height: 190,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text(
                      "weight".tr,
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
                          Text(
                            'age'.tr,
                            style: const TextStyle(fontSize: 16),
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
                                  style: const TextStyle(fontSize: 25),
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
                              CustomDivider(text: "activity".tr),
                              ActivityContainer(
                                text: "sedentary".tr,
                                index: 1,
                              ),
                              ActivityContainer(
                                text: "lightly".tr,
                                index: 2,
                              ),
                              ActivityContainer(
                                text: "moderately".tr,
                                index: 3,
                              ),
                              ActivityContainer(
                                text: "very".tr,
                                index: 4,
                              ),
                              ActivityContainer(
                                text: "extra".tr,
                                index: 5,
                              ),
                              const SizedBox(height: 20,),
                              CustomDivider(text: "allergyIllness".tr),
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 20,
                                children : [
                              AllergyContainer(
                                text: "diabetes".tr,
                                index: 1,
                              ),
                              AllergyContainer(
                                text: "hypertension".tr,
                                index: 2,
                              ),
                              AllergyContainer(
                                text: "celiac".tr,
                                index: 3,
                              ),
                              AllergyContainer(
                                text: "wheat".tr,
                                index: 4,
                              ),
                              AllergyContainer(
                                text: "milk".tr,
                                index: 5,
                              ),
                                ],
                              ),
                              CustomButton(
                                text: "tdee".tr,
                                press: (){
                                  controller.updateData();
                                }
                              ),
                              const SizedBox(height: 20,)
                            ],
                          ),
                  ),
      ),
    )
    );
  }
}
