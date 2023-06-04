import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  const CustomDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
                                children: [
                                  Expanded(child: Divider(endIndent: 5, color: Colors.black,)),
                                  Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  Expanded(child: Divider(indent: 5, color: Colors.black,)),
                                ],
                              );
  }
}