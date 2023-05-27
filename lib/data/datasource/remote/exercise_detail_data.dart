import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class ExerciseDetailData{
  Crud crud;

  ExerciseDetailData(this.crud);

  postData(int catid, int musid) async{
    var response = await crud.postData(ApiLinks.exercise, {
      "catid":catid.toString(),
      "musid":musid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}