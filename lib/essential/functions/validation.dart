import 'package:get/get.dart';

validateEmailInput(String val){

  if(val.isEmpty)
  {
    return "This field cant be empty";
  }
  else
  {
    if(!GetUtils.isEmail(val))
    {
      return "Please enter a valid email";
    }
  }

}

validatePasswordInput(String val){

  /*
  r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
  $
  */

  RegExp passwordPattern = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
  );

  if(val.isEmpty)
  {
    return "This field cant be empty";
  }
  else
  {
    if(!passwordPattern.hasMatch(val))
    {
      return "Password must contain at least 1 upper case,\n1 lower case, 1 numeric, and 1 special character";
    }
  }
}

validateName(String val){

  if(val.isEmpty)
  {
    return "This field cant be empty";
  }
  else
  {
    if(!GetUtils.isAlphabetOnly(val))
    {
      return "Please enter a valid name";
    }
  }
  
}