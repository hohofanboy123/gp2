import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/essential/constants/image_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../essential/shared/container.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[300]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.lunch_dining_outlined,
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
      appBar: AppBar(
        title: const Text("HOME PAGE"),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 30,
          ),
        ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const <Widget>[
            HomeContainer(
              image: ImageUse.calories,
              title: "Calories",
              text: "Track your calories and keep\nup with your daily goal!",
            ),
            HomeContainer(
              image: ImageUse.exercises,
              title: "Exercises",
              text: "Train different parts of your\nbody to achieve your dream\nphysique",
            ),
            HomeContainer(
              image: ImageUse.posts,
              title: "Posts",
              text: "Join the online community\nand read our new posts.",
            ),
            HomeContainer(
              image: ImageUse.diets,
              title: "Diet",
              text: "Track what you eat",
            ),
          ],
        ),
      ),
    );
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