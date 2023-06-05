import 'package:fexercise/controller/multiscreen_controller.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MultiScreen extends StatelessWidget{
  const MultiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultiScreenControllerImp>(
              builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue2,
        toolbarHeight: 100,
          flexibleSpace: Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      "hello".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ", ${controller.name}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[300]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: animationDuration,
              tabBackgroundColor: blue2,
              onTabChange: (index){
                controller.changePage(index);
              },
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'home'.tr,
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'favorite'.tr,
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                  text: 'profile'.tr,
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'settings'.tr,
                ),
      ],
      ),
          ),
        ),
      ),
      body: controller.listPage.elementAt(controller.currPage),
    ));
  }
}
