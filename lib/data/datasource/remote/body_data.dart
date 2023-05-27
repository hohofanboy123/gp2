import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class BodyData{
  Crud crud;

  BodyData(this.crud);

  postData(String id, String gender, String weight, String height, String age, String activity) async{
    var response = await crud.postData(ApiLinks.bodyData, {
      "id": id,
      "gender": gender,
      "weight": weight,
      "height": height,
      "age": age,
      "activity": activity,
    });
    return response.fold((l) => l, (r) => r);
  }
}