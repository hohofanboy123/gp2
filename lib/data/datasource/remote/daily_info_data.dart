import '../../../../essential/classes/crud.dart';
import '../../../../link_api.dart';

class DailyInfoData {
  Crud crud;

  DailyInfoData(this.crud);

  getFoodHistory(String id, DateTime date) async {
    var formattedDate = '${date.year}-${date.month}-${date.day}';
    var response = await crud.postData(ApiLinks.foodHistory, {
      "id": id,
      "date": formattedDate.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  emptyBowl(String id) async {
    var response = await crud.postData(ApiLinks.emptyBowl, {
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }

  dailyInfo(String id) async {
    var response = await crud.postData(ApiLinks.dailyInfo, {
      "id": id
    });
    return response.fold((l) => l, (r) => r);
  }

  resetDailyInfo(String id, DateTime date) async {
    var formattedDate = '${date.day}';
    var response = await crud.postData(ApiLinks.resetDailyInfo, {
      "id": id,
      "date": formattedDate
    });
    return response.fold((l) => l, (r) => r);
  }

}