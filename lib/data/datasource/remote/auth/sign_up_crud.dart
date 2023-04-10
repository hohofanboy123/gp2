import 'package:fexercise/link_api.dart';

import '../../../../essential/classes/crud.dart';



class SignUpData{
  Crud crud;

  SignUpData(this.crud);

  postData(String fname, String lname, String email, String password) async{
    var response = await crud.postData(ApiLinks.signUp, {
      "fname" : fname,
      "lname" : lname,
      "email" : email,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}