import 'package:cached_network_image/cached_network_image.dart';
import 'package:fexercise/controller/food_controller.dart';
import 'package:fexercise/data/model/food_model.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../controller/categories_controller.dart';
import '../../../data/model/categories_model.dart';
import '../../../link_api.dart';
import 'nutrients.dart';

class FoodList extends GetView<FoodControllerImp> {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          //separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.food.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Foods(
              i: index,
              foodModel:
                  FoodModel.fromJson(controller.food[index]),
            );
          },
        ),
    );
  }
}

class Foods extends GetView<FoodControllerImp> {
  final FoodModel foodModel;
  final num? i;
  const Foods({Key? key, required this.foodModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 140,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5)
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                   Hero(
                    tag: "${foodModel.foodId}",
                     child: CachedNetworkImage(
                              imageUrl: "${ApiLinks.foodImg}/${foodModel.foodImage}",
                              fit: BoxFit.scaleDown,
                              ),
                   ),
                    SizedBox(width: 10,),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Text(
                          "${foodModel.foodNameEn}",
                          //textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                      ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.fire, color: Colors.red,size: 15,),
                        Text(" ${(foodModel.kcal!*100).toStringAsFixed(0)} Kcal ⋅ 100g"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Nutrients(
                          color: Colors.green,
                          amount: "${((foodModel.carbs!)*100).toStringAsFixed(1)}g",
                          title: "Carbs",
                          percent: (foodModel.carbs!) > 1 ? 1 : (foodModel.carbs!)*100/100,
                        ),
                        Nutrients(
                          color: Colors.red,
                          amount: "${((foodModel.fats!)*100).toStringAsFixed(1)}g",
                          title: "Fats",
                          percent: (foodModel.fats!) > 1 ? 1 : (foodModel.fats!)*100/100,
                        ),
                        Nutrients(
                          color: Colors.orange,
                          amount: "${((foodModel.protein!)*100).toStringAsFixed(1)}g",
                          title: "Protein",
                          percent: (foodModel.protein!) > 1 ? 1 : (foodModel.protein!)*100/100,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
            onTap: (){
              controller.goToFoodDetail(foodModel);
            },
      ),
    );
  }
}

