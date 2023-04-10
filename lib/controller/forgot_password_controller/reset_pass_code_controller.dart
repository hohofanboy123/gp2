import 'package:fexercise/data/datasource/remote/forgot_password/reset_password_code_data.dart';
import 'package:get/get.dart';

import '../../essential/classes/status_request.dart';
import '../../essential/constants/route_name.dart';
import '../../essential/functions/handling_data_controller.dart';

abstract class ResetPasswordCodeController extends GetxController {

  goToResetPassword(String verificationCode);
  
}

class ResetPasswordCodeControllerImp extends ResetPasswordCodeController {

  //SignUpCodeData signUpCodeData = SignUpCodeData(Get.find());
  String? email;
  StatusRequest? statusRequest;
  
  ResetPasswordCodeData resetPasswordCodeData = ResetPasswordCodeData(Get.find());


  @override
  goToResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordCodeData.postData(email!, verificationCode);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          Get.offNamed(AppRoute.resetPassword, arguments: {"email" : email});
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
  
  
  
