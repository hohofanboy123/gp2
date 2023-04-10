import 'package:fexercise/essential/getxservices/services.dart';
import 'package:fexercise/essential/localization/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{

  Locale? language;

  Services services = Get.find();

  ThemeData appTheme = englishTheme;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    services.sharedPreferences.setString("lang", langCode);
    Get.changeTheme(appTheme);
    appTheme = langCode == "ar" ? arabicTheme : englishTheme;
    Get.updateLocale(locale);
  }

  @override
  void onInit(){

    String? langSharedPref = services.sharedPreferences.getString("lang");

    if(langSharedPref == "ar"){
      language = const Locale("ar");
      appTheme = arabicTheme;
    }
    else if (langSharedPref == "en"){
      language = const Locale("en");
      appTheme = englishTheme;
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}