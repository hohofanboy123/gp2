import 'package:fexercise/data/model/food_model.dart';
import 'package:get/get.dart';

abstract class FoodDetailController extends GetxController{

}

class FoodDetailControllerImp extends FoodDetailController{

  late FoodModel foodModel;

  initialData(){
    foodModel = Get.arguments['foodModel'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}