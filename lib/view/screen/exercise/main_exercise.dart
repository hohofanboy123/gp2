import 'package:fexercise/data/model/muscle_model.dart';
import 'package:fexercise/essential/classes/data_view_handle.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/widget/custom_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/categories_controller.dart';
import 'exercise_type.dart';

class MainExercise extends StatelessWidget {
  const MainExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CategoriesControllerImp contrller = Get.put(CategoriesControllerImp());
    Get.put(CategoriesControllerImp());
    return  GetBuilder<CategoriesControllerImp>(
              builder: (controller) => DataViewHandle(
                  statusRequest: controller.statusRequest,
                  widget:
    Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const ExerciseType(),
          const Divider(
            height: 1,
            color: blue3,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(height: 10,),
      GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 2,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              controller.changeMuscle(index);
              controller.goToExercise();
            },
            child: CustomGridView(muscleModel: MuscleModel.fromJson(controller.data[index])));
      })],
      ),
    ),
    ),
    );
  }
}