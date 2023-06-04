import 'package:fexercise/data/datasource/remote/comments_data.dart';
import 'package:fexercise/data/model/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';
import '../../essential/getxservices/services.dart';



abstract class CommentsContoller extends GetxController{

  getData();
  commentAComment();

}

class CommentsContollerImp extends CommentsContoller{

  Services services = Get.find();
  late TextEditingController commentContent;
  CommentData commentData = CommentData(Get.find());
  late StatusRequest statusRequest;
  List comments = [];
  int? id;

  late PostsModel postsModel;

  DateTime currentTime = DateTime.now();

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
      var response = await commentData.getCommentData(postsModel.postId.toString());
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          comments.addAll(response['data']);
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
  }

  @override
  void onInit() {
    id = services.sharedPreferences.getInt("id");
    postsModel = Get.arguments['postModel'];
    commentContent = TextEditingController();
    getData();
    super.onInit();
  }
  
  @override
  void dispose() {
    commentContent.dispose();
    super.dispose();
  }

  @override
  commentAComment() async {
    comments.clear();
    statusRequest = StatusRequest.loading;
      var response = await commentData.commentAComment(postsModel.postId.toString(), id.toString(),  commentContent.text, currentTime);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          getData();
        }
        else
        {
          statusRequest = StatusRequest.taskFailure;
        }
      }
      update();
      commentContent.clear();
  }

}