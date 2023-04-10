import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';



class ResetPasswordCodeData{
  Crud crud;

  ResetPasswordCodeData(this.crud);

  postData(String email, String verifyCode) async{
    var response = await crud.postData(ApiLinks.resetPasswordCode, {
      "email" : email,
      "verify_code" : verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}