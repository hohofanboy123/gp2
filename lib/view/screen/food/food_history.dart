
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/daily_info_controller.dart';
import '../../../data/model/food_history_model.dart';
import '../../../essential/functions/db_translation.dart';
import '../../../link_api.dart';
import '../bowl/bowl_nutrients.dart';

class FoodHistory extends GetView<DailyInfoControllerImp> {
  const FoodHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
          //separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.foodHistory.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return FoodsEaten(
              i: index,
              foodHistoryModel:
                  FoodHistoryModel.fromJson(controller.foodHistory[index]),
            );
          }
    );
  }
}

class FoodsEaten extends GetView<DailyInfoControllerImp> {
  final FoodHistoryModel foodHistoryModel;
  final num? i;
  const FoodsEaten({Key? key, required this.foodHistoryModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
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
              CachedNetworkImage(
                              imageUrl: "${ApiLinks.foodImg}/${foodHistoryModel.foodImage}",
                              fit: BoxFit.scaleDown,
                              ),
                              const SizedBox(width: 10,),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Text(
                          "${translateDB(foodHistoryModel.foodNameEn, foodHistoryModel.foodNameAr)}",
                          
                          //textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                      ),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.fire, color: Colors.red,size: 15,),
                        Text(" ${(foodHistoryModel.kcal)} "),
                        Text("kcal2".tr),
                        Text(" ⋅ ${(foodHistoryModel.quantity!)} "),
                        Text("unit2".tr)
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BowlNutrients(
                            nutrient: "${foodHistoryModel.carbs}",
                            icon: const FaIcon(FontAwesomeIcons.breadSlice , size: 15,),
                          ),
                          BowlNutrients(
                            nutrient: "${foodHistoryModel.fats}",
                            icon: const FaIcon(FontAwesomeIcons.bacon , size: 15,),
                          ),
                          BowlNutrients(
                            nutrient: "${foodHistoryModel.protein}",
                            icon: const FaIcon(FontAwesomeIcons.drumstickBite , size: 15,),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          
                          onPressed: (){
                            
                          },
                          icon: const FaIcon(FontAwesomeIcons.trash, size: 15,),
                        ),
                        //Text("    "),
                      ],
                    ),
                  ],
                ),
              )
            ]),
            onTap: (){
            },
      ),
    );
  }
}

