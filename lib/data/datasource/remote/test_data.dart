import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class TestData{
  Crud crud;

  TestData(this.crud);

  getData() async{
    var response = await crud.postData(ApiLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}