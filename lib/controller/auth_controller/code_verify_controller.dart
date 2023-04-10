import 'package:fexercise/data/datasource/remote/auth/sign_up_code_data.dart';
import 'package:fexercise/essential/constants/route_name.dart';
import 'package:get/get.dart';

import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';

abstract class VerifyOtpCodeController extends GetxController {

  goToSignUp();
  checkOtpCode();
  goToAccCreated(String verificationCode);
  
}

class VerifyOtpCodeControllerImp extends VerifyOtpCodeController {

  SignUpCodeData signUpCodeData = SignUpCodeData(Get.find());

  String? email;

  @override
  checkOtpCode(){

  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  
  StatusRequest? statusRequest;


  @override
  goToAccCreated(String verificationCode) async {
    statusRequest = StatusRequest.loading;
      update();
      var response = await signUpCodeData.postData(email!, verificationCode);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.offNamed(AppRoute.accountCreated);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "WRONG CODE");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}