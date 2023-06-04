import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class PostsData{
  Crud crud;

  PostsData(this.crud);

  getPostData() async{
    var response = await crud.postData(ApiLinks.postData, {});
    return response.fold((l) => l, (r) => r);
  }

  post(String id, String content, DateTime date) async{
    var response = await crud.postData(ApiLinks.postAPost, {
      "id":id,
      "content":content,
      "date":date.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}