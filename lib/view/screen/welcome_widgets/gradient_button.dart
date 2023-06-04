import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final RadialGradient gradient;
  final Function onPressed;

  const RaisedGradientButton({super.key, required this.child, required this.gradient, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * (25 / 375.0),
        vertical: Get.height * (2.5 / 375.0),
      ),
      width: Get.width / 1.55,
      height: Get.height / 15,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(35)
        ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            child: Center(
              child: child,
            )),
      ),
    );
  }
}