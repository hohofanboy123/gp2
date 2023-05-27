import 'package:fexercise/view/screen/exercise/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/exercise_detail_controller.dart';
import '../../../essential/classes/data_view_handle.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ExerciseDetailsControllerImp());
    return GetBuilder<ExerciseDetailsControllerImp>(
              builder: (controller) => DataViewHandle(
                  statusRequest: controller.statusRequest,
                  widget:
            Scaffold(
              appBar: AppBar(
        title: Text("12".tr),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
      ),
            body: 
                  ListView(
                    shrinkWrap: true,
                    children: const [
                      ExerciseDetail(),
                    ],
                  ),
              ),
          ));
          
  }
}