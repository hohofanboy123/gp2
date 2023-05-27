import 'package:cached_network_image/cached_network_image.dart';
import 'package:fexercise/data/model/food_model.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:fexercise/view/widget/macros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../controller/food_detail_controller.dart';
import '../../../link_api.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    FoodDetailControllerImp controller = Get.put(FoodDetailControllerImp());
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            //color: blue2,
            ),
          ),
          Positioned(
            top: - Get.width * 0.5,
            child: Opacity(
              opacity: 0.5,
              child: CachedNetworkImage(
                    imageUrl: "${ApiLinks.foodImg}/${controller.foodModel.foodImage}",
                    width: Get.width * 1.2,
                    fit: BoxFit.cover,
              ),
            )
          ),
          Positioned(
            top: 100,
            right: Get.width / 6,
            left: Get.width / 6,
              child: Hero(
                tag: "${controller.foodModel.foodId}",
                child: CachedNetworkImage(
                    imageUrl: "${ApiLinks.foodImg}/${controller.foodModel.foodImage}",
                  ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFFFFDFA),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]
                  ),
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  height: Get.height/2,
                  width: Get.width,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${controller.foodModel.foodNameEn}",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("MACROS PER 100G" , style: TextStyle(fontSize: 15),)
                        ),
                        Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.fire, size: 15, color: Colors.red,),
                                  Text(" ${(controller.foodModel.kcal!*100).toStringAsFixed(0)} Kcal"),
                                ],
                              ),
                        //SizedBox(height: 20,),
                            Macros(
                              name: "Carbs",
                              icon: FaIcon(FontAwesomeIcons.breadSlice, size: 25, color: Colors.green.withOpacity(0.5),),
                              grams: "${((controller.foodModel.carbs!)*100).toStringAsFixed(1)}g",
                              percent: controller.foodModel.carbs! * 1.0,
                              color: const LinearGradient(
                                  colors: [
                                    Color(0XFF66BC46),
                                    Color(0XFF47B649)
                                  ]
                                  ),
                              bgColor: Colors.green.withOpacity(0.5),
                              ),
                            Macros(
                              name: "Fats",
                              icon: FaIcon(FontAwesomeIcons.bacon, size: 25, color: Colors.red.withOpacity(0.5),),
                              grams: "${((controller.foodModel.fats!)*100).toStringAsFixed(1)}g",
                              percent: controller.foodModel.fats! * 1.0,
                              color: const LinearGradient(
                                  colors: [
                                    Color(0XFFD62121),
                                    Color(0XFFC72C2C)
                                  ]
                                  ),
                              bgColor: Colors.red.withOpacity(0.5),
                              ),
                            Macros(
                              name: "Protein",
                              icon: FaIcon(FontAwesomeIcons.drumstickBite, size: 25, color: Colors.orange.withOpacity(0.5),),
                              grams: "${((controller.foodModel.protein!)*100).toStringAsFixed(1)}g",
                              percent: controller.foodModel.protein! * 1.0,
                              color: const LinearGradient(
                                  colors: [
                                    Color(0XFFFD7F2C),
                                    Color(0XFFFF6200)
                                  ]
                                  ),
                              bgColor: Colors.orange.withOpacity(0.5),
                              ),
                              Text("Enter amount in grams" , style: TextStyle(fontSize: 15),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        //labelText: "Enter amount",
                                        hintText: "e.g., 100",
                                        hintStyle: const TextStyle(
                                          fontSize: 12,
                                        ),
                                    ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: (){},
                                      child: Text("Add to bowl"),
                                      style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(orange),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                            ),
                                          ),
                                    ),
                                  )
                                ],
                              ),
                          ]
                            ),
                  ),
                 
              ],
            ),
        ],
      ),
    );
  }
}