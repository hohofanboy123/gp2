

import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';

class SignUpCodeData{
  Crud crud;

  SignUpCodeData(this.crud);

  postData(String email, String verifyCode) async{
    var response = await crud.postData(ApiLinks.signUpCode, {
      "email" : email,
      "verify_code" : verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}