import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories_controller.dart';
import '../../../data/model/categories_model.dart';
import '../../../link_api.dart';

class ExerciseType extends GetView<CategoriesControllerImp> {
  const ExerciseType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 70,
      width: 100,
      child: ListView.builder(
        //separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<CategoriesControllerImp>(
            builder:(controller) => 
              Container(
                decoration: controller.catid == i ? const BoxDecoration(
                    shape: BoxShape.circle,
                    color: orangeRed,
                    ) : const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blue2,
                    ),
                height: 50,
                width: 100,
                child: IconButton(
                  onPressed: () {
                    controller.changeType(i!);
                },
                  icon: SvgPicture.network(
                        "${ApiLinks.categoriesImg}/${categoriesModel.categoryIcon}",
                        fit: BoxFit.scaleDown,
                        ),
                ),
                ),
          ),
          Text(
            "${categoriesModel.categoryNameEn}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          )
        ]);
  }
}
