import 'package:flutter/material.dart';

import '../constants/global_constants.dart';

class CustomeInkWell extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap;
  const CustomeInkWell({super.key, required this.textOne, required this.textTwo, required this.onTap});
  
  @override
  Widget build(BuildContext context){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textOne),
                InkWell(
                  onTap: onTap,
                  child: Text(
                    textTwo,
                    style: const TextStyle(
                      color: orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            );
  }
}