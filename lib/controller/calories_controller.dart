import 'package:fexercise/data/datasource/remote/body_data.dart';
import 'package:fexercise/view/screen/calories/daily_info.dart';
import 'package:get/get.dart';

import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';
import '../essential/getxservices/services.dart';

abstract class ColoriesController extends GetxController {

  genderSelection(bool isMale);
  setHeight(int heightValue);
  setWeight(int weightValue);
  ageInc();
  ageDec();
  activitySelection(int indexActivity);
  goalSelection(int indexGoal);
  updateData();

}


class ColoriesControllerImp extends ColoriesController {

  Services services = Get.find();

  late StatusRequest statusRequest;
  BodyData bodyData = BodyData(Get.find());
  var isMaleSelected = false.obs;
  RxInt selectedGoal = RxInt(-1);
  RxInt selectedActivity = RxInt(-1);
  RxInt height = 120.obs;
  RxInt weight = 30.obs;
  RxInt age = 0.obs;
  int? id;
  String? gender;

  @override
  genderSelection(isMale) {
    isMaleSelected.value = isMale;
    update();
  }
  
  @override
  setHeight(int heightValue) {
    height.value = heightValue;
  }
  
  @override
  setWeight(int weightValue) {
    weight.value = weightValue;
  }

  @override
  ageInc() {
    age.value++;
  }
  
  @override
  ageDec() {
    if (age.value > 0) {
      age.value--;
    }
  }
  
  @override
  activitySelection(indexActivity) {
    selectedActivity.value = indexActivity;
    update();
  }

  @override
  goalSelection(indexGoal) {
    selectedGoal.value = indexGoal;
    update();
  }
  
  @override
  updateData() async{
    statusRequest = StatusRequest.loading;
    gender = isMaleSelected.value == true ? "male" : "female";
    services.sharedPreferences.setString("gender", gender!);
      var response = await bodyData.postData(
        id!.toString(),
        gender!,
        weight.toString(),
        height.toString(),
        age.toString(),
        selectedActivity.toString(),
        selectedGoal.toString()
      );
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          insertAllergy();
          Get.to(() => const DailyInfo());
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
  }

  RxList<int> selectedAllergies = <int>[].obs;


void toggleSelectedAllergy(int index) {
  if (isSelectedAllergy(index)) {
    selectedAllergies.removeWhere((item) => item == index);
  } else {
    selectedAllergies.add(index);
  }
}

bool isSelectedAllergy(int index) {
  return selectedAllergies.contains(index);
}

insertAllergy()
{
  for(var index in selectedAllergies) {
      bodyData.insertAllergy(
        id!.toString(),
        index.toString()
      );
    }
}


  @override
  void onInit() {
    id = services.sharedPreferences.getInt("id");
    super.onInit();
  }


}