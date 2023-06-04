import 'package:fexercise/essential/constants/route_name.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/datasource/remote/bowl_data.dart';
import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';
import '../essential/getxservices/services.dart';

abstract class BowlController extends GetxController {

  getBowlItems();
  addToFoodHistory();
  removeFromBowl(int itemid);
  bowlSummary();
  addNutrients();

}

class BowlControllerImp extends BowlController {

  int consumedKcal = 0;
  int consumedCarbs = 0;
  int consumedFats = 0;
  int consumedProtein = 0;

  Services services = Get.find();
  late StatusRequest statusRequest;
  BowlData bowlData = BowlData(Get.find());

  int? id;
  String? date;

  List bowl = [];

  @override
  void onInit() {
    id = services.sharedPreferences.getInt("id");
    date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    getBowlItems();
    super.onInit();
  }

  @override
  getBowlItems() async {
    statusRequest = StatusRequest.loading;
      var response = await bowlData.getData(id!.toString());
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          bowl.addAll(response['data']);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      bowlSummary();

      update();
      //String? previousRoute = Get.previousRoute;
  }
  
  @override
  addToFoodHistory() async {

  var response;

    statusRequest = StatusRequest.loading;
    for (var item in bowl) {
      response = await bowlData.addItemsToFoodHistory(
        id!.toString(),
        item["bowl_food_id"].toString(),
        item["quantity"].toString(),
        item["totalKcal"].toString(),
        item["totalCarbs"].toString(),
        item["totalFats"].toString(),
        item["totalProtein"].toString(),
        date!
      );
    }
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          addNutrients();
          Get.offNamed(AppRoute.dailyInfo);
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }
  
  @override
  removeFromBowl(itemid) async {
    bowl.clear();
    statusRequest = StatusRequest.loading;
      var response = await bowlData.removeFromBowl(itemid.toString());
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          getBowlItems();
          bowlSummary();
          Get.defaultDialog(title: "YAY", middleText: "REMOVED");
        }
        else
        {
          Get.defaultDialog(title: "OOPS", middleText: "INCORRECT EMAIL OR PASSWORD");
          statusRequest = StatusRequest.taskFailure;
        }
      }
      refresh();
  }
  
  @override
  bowlSummary() {
  consumedKcal = 0;
  consumedCarbs = 0;
  consumedFats = 0;
  consumedProtein = 0;
    for(var item in bowl){
        consumedKcal = consumedKcal + (item["totalKcal"] as int);
        consumedCarbs = consumedCarbs + (item["totalCarbs"] as int);
        consumedFats = consumedFats + (item["totalFats"] as int);
        consumedProtein = consumedProtein + (item["totalProtein"] as int);
      }
  }
  
  @override
  addNutrients() {
    bowlData.addNutrients(
      id.toString(),
      consumedKcal.toString(),
      consumedCarbs.toString(),
      consumedFats.toString(),
      consumedProtein.toString()
    );
  }
  

    


}