import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class AddFoodData{
  Crud crud;

  AddFoodData(this.crud);

  postData(String id, String foodid, String quantity, String kcal, String carbs, String fats, String protein) async{
    var response = await crud.postData(ApiLinks.addToBowl, {
      "id": id,
      "foodid": foodid,
      "quantity": quantity,
      "kcal" : kcal,
      "carbs": carbs,
      "fats": fats,
      "protein" : protein
    });
    return response.fold((l) => l, (r) => r);
  }

  getRisk(String id, String foodid) async{
    var response = await crud.postData(ApiLinks.foodRisk, {
      "id": id,
      "foodid": foodid
    });
    return response.fold((l) => l, (r) => r);
  }
}