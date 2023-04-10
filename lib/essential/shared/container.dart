import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/global_constants.dart';

class HomeContainer extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  
  const HomeContainer({super.key, required this.image, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 175,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * (15 / 375.0),
        vertical: Get.height * (10 / 812.0),
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 5),
            blurRadius: 5,
            color: Colors.grey,
          )
        ],
        borderRadius: BorderRadius.circular(30),
        color: blue1,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                image,
                width: Get.width * (130 / 375.0),
                height: Get.height * (130 / 812.0),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            bottom: 15,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
