import 'package:flutter/material.dart';


//General text field
class CustomTextField extends StatelessWidget{
  final String labelTxt;
  final String hintTxt;
  final IconData icon;
  final String? Function(String?) validation;
  final TextEditingController? cont;

  const CustomTextField({
    super.key,
    required this.labelTxt,
    required this.hintTxt,
    required this.icon,
    required this.validation,
    this.cont
    });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              validator: validation,
              controller: cont,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(icon),
                labelText: labelTxt,
                hintText: hintTxt,
                hintStyle: const TextStyle(
                  fontSize: 12,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            );
  }
  
}

//email custom textfield
class EmailCustomTextField extends StatelessWidget{
  final String labelTxt;
  final String hintTxt;
  final IconData icon;
  final String? Function(String?) validation;
  final TextEditingController? cont;

  const EmailCustomTextField({
    super.key,
    required this.labelTxt,
    required this.hintTxt,
    required this.icon,
    required this.validation,
    this.cont
    });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              validator: validation,
              controller: cont,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: labelTxt,
                hintText: hintTxt,
                hintStyle: const TextStyle(
                  fontSize: 12,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            );
  }
  
}

//Password text field
class CustomPasswordTextField extends StatelessWidget{
  final String labelTxt;
  final String hintTxt;
  final IconData icon;
  final IconData icon2;
  final String? Function(String?) validation;
  final TextEditingController? cont;
  final bool? visibilityOff;
  final void Function()? showPassword;

  const CustomPasswordTextField({
    super.key,
    required this.labelTxt,
    required this.hintTxt,
    required this.icon,
    required this.icon2,
    required this.validation,
    this.cont,
    this.visibilityOff,
    this.showPassword,
    });
  
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            validator: validation,
            controller: cont,
            obscureText: visibilityOff == null || visibilityOff == false ? false : true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Icon(icon),
              suffixIcon: IconButton(
                icon: Icon(
                  visibilityOff == true ? icon2 : Icons.visibility_outlined,
                ),
                onPressed: () {
                  showPassword!();
                },
              ),
              labelText: labelTxt,
              hintText: hintTxt,
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
            ),
          );
  }
  
}