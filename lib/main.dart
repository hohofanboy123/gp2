import 'package:fexercise/bindings/initial_bind.dart';
import 'package:fexercise/essential/getxservices/services.dart';
import 'package:fexercise/essential/localization/change_lang.dart';
import 'package:fexercise/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'essential/localization/translate.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageController controller = Get.put(LanguageController());
    return GetMaterialApp(
      translations: Translate(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
