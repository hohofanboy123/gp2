import 'package:fexercise/data/datasource/remote/exercise_detail_data.dart';
import 'package:get/get.dart';

import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';

abstract class ExerciseDetailsController extends GetxController{

getExerciseData(int categoryid, int muscleid);

}

class ExerciseDetailsControllerImp extends ExerciseDetailsController{

ExerciseDetailData exerciseDetailData = ExerciseDetailData(Get.find());

int? catid;
int? musid;
List exercise = [];

late StatusRequest statusRequest;

@override
  void onInit() {
    catid = Get.arguments['catid']+1;
    musid = Get.arguments['musid']+1;
    getExerciseData(catid!, musid!);
    super.onInit();
  }

@override
getExerciseData(categoryid, muscleid) async {
    statusRequest = StatusRequest.loading;
      var response = await exerciseDetailData.postData(categoryid, muscleid);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          exercise.addAll(response['data']);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }

  

}