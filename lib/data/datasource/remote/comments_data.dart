import 'package:fexercise/link_api.dart';

import '../../../essential/classes/crud.dart';

class CommentData{
  Crud crud;

  CommentData(this.crud);

  getCommentData(String postid) async{
    var response = await crud.postData(ApiLinks.commentData, {
      "postid":postid
    });
    return response.fold((l) => l, (r) => r);
  }

  commentAComment(String postid, String id, String content, DateTime date) async{
    var response = await crud.postData(ApiLinks.commentAComment, {
      "postid":postid,
      "id":id,
      "content":content,
      "date":date.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  
}