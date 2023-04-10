import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';



class ResetPasswordData{
  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email, String password) async{
    var response = await crud.postData(ApiLinks.resetPassword, {
      "email" : email,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}