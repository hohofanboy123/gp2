import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';



class SignInData{
  Crud crud;

  SignInData(this.crud);

  postData(String email, String password) async{
    var response = await crud.postData(ApiLinks.signIn, {
      "email" : email,
      "password" : password,
    });
    return response.fold((l) => l, (r) => r);
  }
}