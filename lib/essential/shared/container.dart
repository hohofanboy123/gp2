import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class HomeContainer extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final Color color;
  final VoidCallback onTap;

  const HomeContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              offset: Offset(0, 5),
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: color,
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
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}