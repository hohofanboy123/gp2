import '../../../essential/classes/crud.dart';
import '../../../link_api.dart';

class MuscleData{
  Crud crud;

  MuscleData(this.crud);

  getData() async{
    var response = await crud.postData(ApiLinks.muscles, {});
    return response.fold((l) => l, (r) => r);
  }
}