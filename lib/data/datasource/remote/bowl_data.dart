import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class BowlData{
  Crud crud;

  BowlData(this.crud);

  getData(String id) async{
    var response = await crud.postData(ApiLinks.bowlItems, {
      "id":id,
    });
    return response.fold((l) => l, (r) => r);
  }

  addItemsToFoodHistory(String userId, String foodid, String quantity, String kcal,  String carbs, String fats, String protein, String date) async {
    var response = await crud.postData(ApiLinks.addItemsToHistory, {
      "id": userId,
      "foodid": foodid,
      "quantity": quantity,
      "kcal": kcal,
      "carbs": carbs,
      "fats": fats,
      "protein": protein,
      "date": date
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromBowl(String itemid) async {
    var response = await crud.postData(ApiLinks.removeItemFromBowl, {
      "itemid":itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteBowl(String id) async {
    var response = await crud.postData(ApiLinks.removeItemFromBowl, {
      "id":id,
    });
    return response.fold((l) => l, (r) => r);
  }

  addNutrients(String id, String kcal, String carbs, String fats, String protein) async {
    var response = await crud.postData(ApiLinks.updateInfo, {
      "id":id,
      "kcal":kcal,
      "carbs":carbs,
      "fats":fats,
      "protein":protein
    });
    return response.fold((l) => l, (r) => r);
  }

}