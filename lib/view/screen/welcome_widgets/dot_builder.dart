import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/welcome_controller.dart';
import '../../../data/datasource/static/static.dart';
import '../../../essential/constants/global_constants.dart';

class DotBuilder extends StatelessWidget {
  const DotBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeControllerImp>(
      builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              welcomeModelList.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.all(5),
                duration: animationDuration,
                width: controller.currPage == index ? Get.width * (30 / 375.0) : Get.width * (10 / 375.0),
                height: 6,
                decoration: BoxDecoration(
                  color: controller.currPage == index ? orange : const Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
