import 'package:get/get.dart';

import '../data/datasource/remote/daily_info_data.dart';
import '../essential/classes/status_request.dart';
import '../essential/functions/handling_data_controller.dart';
import '../essential/getxservices/services.dart';

abstract class DailyInfoController extends GetxController{

getFoodData();
emptyBowl();
getDailyInfo();
resetDailyInfo();

}

class DailyInfoControllerImp extends DailyInfoController{

Services services = Get.find();
int? id;
DailyInfoData dailyInfoData = DailyInfoData(Get.find());
List foodHistory = [];
DateTime currentTime = DateTime.now();

int tdee = 0;
int carbsDaily = 0;
int fatsDaily = 0;
int proteinDaily = 0;
int consumedKcal = 0;
int consumedCarbs = 0;
int consumedFats = 0;
int consumedProtein = 0;


late StatusRequest statusRequest;

@override
  void onInit() {
    id = services.sharedPreferences.getInt("id");
    getDailyInfo();
    resetDailyInfo();
    getFoodData();
    Get.previousRoute == "/bowl/bowl_view.dart" ? emptyBowl() : null;
    super.onInit();
  }

  @override
  getDailyInfo() async {
      var response = await dailyInfoData.dailyInfo(id.toString());
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          var data = response['data'][0];
            tdee = data['TDEE'];
            carbsDaily = data['carbs_daily'];
            fatsDaily = data['fats_daily'];
            proteinDaily = data['protein_daily'];
            consumedKcal = data['consumed_kcal'];
            consumedCarbs = data['consumed_carbs'];
            consumedFats = data['consumed_fats'];
            consumedProtein = data['consumed_protein'];
        }
        else
        {
        }
      }
      update();
  }

@override
getFoodData() async {
    statusRequest = StatusRequest.loading;
      var response = await dailyInfoData.getFoodHistory(id.toString(), currentTime);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          foodHistory.addAll(response['data']);
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }




  @override
  emptyBowl() {
    dailyInfoData.emptyBowl(id.toString());
  }
  
  @override
  resetDailyInfo() {
    dailyInfoData.resetDailyInfo(id.toString(), currentTime);
  }

  

}