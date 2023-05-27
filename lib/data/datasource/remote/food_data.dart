import '../../../essential/classes/crud.dart';
import '../../../link_api.dart';

class FoodData{
  Crud crud;

  FoodData(this.crud);

  getData() async{
    var response = await crud.postData(ApiLinks.food, {});
    return response.fold((l) => l, (r) => r);
  }
}