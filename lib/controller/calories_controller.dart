import 'package:fexercise/data/datasource/remote/body_data.dart';
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
  activitySelection(int index);
  updateData();

}

class ColoriesControllerImp extends ColoriesController {

  Services services = Get.find();

  late StatusRequest statusRequest;
  BodyData bodyData = BodyData(Get.find());
  var isMaleSelected = false.obs;
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
  activitySelection(index) {
    selectedActivity.value = index;
    update();
  }
  
  @override
  updateData() async{
    statusRequest = StatusRequest.loading;
    gender = isMaleSelected.value == true ? "male" : "female";
      var response = await bodyData.postData(id!.toString(), gender!, weight.toString(), height.toString(), age.toString(), selectedActivity.toString());
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.defaultDialog(title: "UPDATED", middleText: "GG");
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "EMAIL ALREADY EXISTS");
          statusRequest = StatusRequest.taskFailure;
        }
      }
  }
  
  @override
  void onInit() {
    id = services.sharedPreferences.getInt("id");
    super.onInit();
  }


}