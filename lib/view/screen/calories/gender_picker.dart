import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/calories_controller.dart';

class GenderPicker extends StatelessWidget {
  final String gender;
  final FaIcon icon;
  final bool val;
  const GenderPicker({
    super.key,
    required this.gender,
    required this.icon,
    required this.val
    });

  @override
  Widget build(BuildContext context) {
    ColoriesControllerImp controller = Get.put(ColoriesControllerImp());
    return GestureDetector(
            onTap: () => controller.genderSelection(val),
            child: Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  height: 190,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: controller.isMaleSelected.value == val
                        ? Border.all(color: Colors.black, width: 4) : Border.all(color: Colors.grey,),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: icon
                        ),
                      const SizedBox(height: 10),
                      Text(
                          gender,
                          style: controller.isMaleSelected.value == val
                              ? const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)
                              : const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                        ),
                    ],
                  ),
                ),
              ),
          );
  }
}