import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularProgressBar extends StatelessWidget {
  final double goalCalories;
  final double consumedCalories;

  const CircularProgressBar({Key? key, required this.goalCalories, required this.consumedCalories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CircularProgressBarController>(
      init: CircularProgressBarController(),
      builder: (controller) {
        final double percentage = controller.calculatePercentage(goalCalories, consumedCalories);

        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: percentage,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.grey[200],
              ),
            ),
            Text(
              "$consumedCalories / $goalCalories",
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

class CircularProgressBarController extends GetxController {
  double calculatePercentage(double goal, double consumed) {
    if (goal == 0) {
      return 0.0;
    }
    return consumed / goal;
  }
}