import 'package:fexercise/essential/constants/route_name.dart';
import 'package:get/get.dart';

import '../essential/getxservices/services.dart';

abstract class WelcomeController extends GetxController {

  onPageChanged(int index);
  goToSignUp();
  goToSignIn();

}

class WelcomeControllerImp extends WelcomeController {

  int currPage = 0;

  Services services = Get.find();

  @override
  onPageChanged(int index) {
    currPage = index;
    update();
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.signIn);
    services.sharedPreferences.setString("check", "1");
  }
  
  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signUp);
    services.sharedPreferences.setString("check", "1");
  }

}








