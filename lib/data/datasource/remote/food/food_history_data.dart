import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';

class FoodHistoryData {
  Crud crud;

  FoodHistoryData(this.crud);

  getData(String id, DateTime date) async {
    var formattedDate = '${date.year}-${date.month}-${date.day}';
    var response = await crud.postData(ApiLinks.foodHistory, {
      "id": id,
      "date": formattedDate.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}