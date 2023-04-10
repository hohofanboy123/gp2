import 'package:flutter/material.dart';

import '../../../essential/constants/global_constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
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
          style: const TextStyle(
            fontSize: 20,//SizeConfig.scrnWidth! * (25 / 375.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}