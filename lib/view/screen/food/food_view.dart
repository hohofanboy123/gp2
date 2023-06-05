import "package:fexercise/data/model/food_model.dart";
import "package:fexercise/essential/classes/data_view_handle.dart";
import "package:fexercise/essential/shared/custom_text_field.dart";
import 'package:fexercise/view/screen/food/food_list.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../controller/food_controller.dart";

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FoodControllerImp());
    return GetBuilder<FoodControllerImp>(
              builder: (controller) =>
      Scaffold(
      body: 
          ListView(
            children: [
              const SizedBox(height: 20,),
              SearchCustomTextField(
                cont: controller.search,
                hintTxt: "searchFood".tr,
                onChanged: (val){
                  controller.checkSearch(val);
                },
                onPressed: (){
                  controller.onSearch();
                },
                //icon: Icons.search,
                //validation: validation
              ),
               DataViewHandle(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch ? 
              const Column(
                children: [
                  FoodList(),
                ],
              )
              : FoodSearch(searchFood: controller.searchFood)),
            ],
          ),
      ));
  }
}

class FoodSearch extends GetView<FoodControllerImp> {
  final List<FoodModel> searchFood;
  
  const FoodSearch({super.key, required this.searchFood});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchFood.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context , index){
        return InkWell(
          onTap: () {
            controller.goToFoodDetail(searchFood[index]);
          },
          child: Text("${searchFood[index].foodNameEn}")
          );
      }
    );
  }
}