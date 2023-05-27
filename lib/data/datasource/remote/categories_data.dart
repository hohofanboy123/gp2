import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class CategoriesData{
  Crud crud;

  CategoriesData(this.crud);

  getData() async{
    var response = await crud.postData(ApiLinks.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}