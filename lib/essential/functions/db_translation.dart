import 'package:get/get.dart';

import '../getxservices/services.dart';

translateDB(columnEn, columnAr){
  Services services = Get.find();

  if(services.sharedPreferences.getString("lang") == "ar"){
    return columnAr;
  }else{
    return columnEn;
  }
}