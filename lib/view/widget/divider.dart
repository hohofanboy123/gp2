import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  const CustomDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
                                children: [
                                  const Expanded(child: Divider(endIndent: 5, color: Colors.black,)),
                                  Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  const Expanded(child: Divider(indent: 5, color: Colors.black,)),
                                ],
                              );
  }
}