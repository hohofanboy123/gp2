import 'package:fexercise/data/datasource/remote/categories_data.dart';
import 'package:fexercise/data/datasource/remote/muscles_data.dart';
import 'package:fexercise/essential/classes/status_request.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:get/get.dart';

import '../essential/functions/handling_data_controller.dart';

abstract class CategoriesController extends GetxController{
  getData();
  changeType(int catVal);
  changeMuscle(int musVal);
  getMusclesData();
  goToExercise();
}

class CategoriesControllerImp extends CategoriesController{

CategoriesData categoriesData = CategoriesData(Get.find());
MuscleData muscleData = MuscleData(Get.find());
int catid = 0;
int musid = 0;
List categories = [];
List data = [];
late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
      var response = await categoriesData.getData();
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          categories.addAll(response['exercise_category']);
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }

  @override
  changeType(catVal) {
    catid = catVal;
    update();
  }
  @override
  changeMuscle(musVal) {
    musid = musVal;
    update();
  }

  @override
  getMusclesData() async{
    statusRequest = StatusRequest.loading;
      var response = await muscleData.getData();
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          data.addAll(response['muscle']);
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }

  @override
  void onInit() {
    getMusclesData();
    getData();
    super.onInit();
  }
  
  @override
  goToExercise() {
    Get.toNamed(AppRoute.exerciseDetail, arguments: {
      "musid": musid,
      "catid": catid,
    });
  }

}