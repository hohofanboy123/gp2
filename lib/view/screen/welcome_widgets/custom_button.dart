
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../essential/constants/global_constants.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * (25 / 375.0),
        vertical: Get.height * (2.5 / 375.0),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(orange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: Get.width * (20 / 375.0),//SizeConfig.scrnWidth! * (25 / 375.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}