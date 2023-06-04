import 'package:cached_network_image/cached_network_image.dart';
import 'package:fexercise/data/model/bowl_model.dart';
import 'package:fexercise/view/screen/bowl/bowl_nutrients.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/bowl_controller.dart';
import '../../../essential/functions/db_translation.dart';
import '../../../link_api.dart';

class BowlList extends GetView<BowlControllerImp> {
  const BowlList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          //separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.bowl.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Bowl(
              i: index,
              bowlModel:
                  BowlModel.fromJson(controller.bowl[index]),
            );
          },
        ),
    );
  }
}

class Bowl extends GetView<BowlControllerImp> {
  final BowlModel bowlModel;
  final num? i;
  const Bowl({Key? key, required this.bowlModel, required this.i})
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
                              imageUrl: "${ApiLinks.foodImg}/${bowlModel.foodImage}",
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
                          "${translateDB(bowlModel.foodNameEn, bowlModel.foodNameEn)}",
                          //textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15),
                      ),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.fire, color: Colors.red,size: 15,),
                        Text(" ${(bowlModel.totalKcal!)} "),
                        Text("kcal2".tr),
                        Text(" ⋅ ${(bowlModel.quantity!)} "),
                        Text("unit2".tr)
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BowlNutrients(
                            nutrient: "${bowlModel.totalCarbs}",
                            icon: const FaIcon(FontAwesomeIcons.breadSlice , size: 15,),
                          ),
                          BowlNutrients(
                            nutrient: "${bowlModel.totalFats}",
                            icon: const FaIcon(FontAwesomeIcons.bacon , size: 15,),
                          ),
                          BowlNutrients(
                            nutrient: "${bowlModel.totalProtein}",
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
                            controller.removeFromBowl(bowlModel.bowlItemId!);
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

