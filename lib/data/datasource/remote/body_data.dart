import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class BodyData{
  Crud crud;

  BodyData(this.crud);

  postData(String id, String gender, String weight, String height, String age, String activity, String goal) async{
    var response = await crud.postData(ApiLinks.bodyData, {
      "id": id,
      "gender": gender,
      "weight": weight,
      "height": height,
      "age": age,
      "activity": activity,
      "goal": goal
    });
    return response.fold((l) => l, (r) => r);
  }

  insertAllergy(String id, String allergyid)async{
    var response = await crud.postData(ApiLinks.insertAllergy, {
      "id":id,
      "allergyid":allergyid
    });
    return response.fold((l) => l, (r) => r);
  }
}