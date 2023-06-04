import 'package:fexercise/controller/multiscreen_controller.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MultiScreen extends StatelessWidget{
  const MultiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MultiScreenControllerImp());
    return GetBuilder<MultiScreenControllerImp>(builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue2,
        toolbarHeight: 100,
          flexibleSpace: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Hello, ${controller.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Calories',
                ),
                GButton(
                  icon: Icons.person_outline_rounded,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
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
 /*SizedBox(
        width: Get.width * (300 / 375.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 156,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: blue1,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: Colors.grey,
                  )
                ]
              ),
            ),
            SvgPicture.asset(
              ImageUse.cat1,
              width: Get.width * (150 / 375.0),
              height: Get.height * (150 / 812.0),
            ),
            Positioned(
              left: 156,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15,
                ),
                height: 156,
                width: Get.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Calories",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Track your calories and keep up with your daily goal!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    )
                  ],
                  ),
              ),
              ),
          ],
        ),
        
        ),*/