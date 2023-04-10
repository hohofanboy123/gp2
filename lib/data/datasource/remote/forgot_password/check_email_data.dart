import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';



class CheckEmailData{
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async{
    var response = await crud.postData(ApiLinks.checkEmail, {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}