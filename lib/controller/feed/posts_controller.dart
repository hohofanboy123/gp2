import 'package:fexercise/data/datasource/remote/posts_data.dart';
import 'package:fexercise/view/screen/feed/comment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/posts_model.dart';
import '../../essential/classes/status_request.dart';
import '../../essential/functions/handling_data_controller.dart';
import '../../essential/getxservices/services.dart';



abstract class PostsController extends GetxController{

  getData();
  postAPost();
  viewComments(PostsModel postsModel);

}

class PostsControllerImp extends PostsController{

  Services services = Get.find();
  late TextEditingController postContent;
  PostsData postsData = PostsData(Get.find());
  late StatusRequest statusRequest;
  List posts = [];
  int? id;

  DateTime currentTime = DateTime.now();

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
      var response = await postsData.getPostData();
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == "success")
        {
          posts.addAll(response['data']);
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
    postContent = TextEditingController();
    getData();
    super.onInit();
  }
  
  @override
  void dispose() {
    postContent.dispose();
    super.dispose();
  }
  
  @override
  postAPost() async {
    posts.clear();
    statusRequest = StatusRequest.loading;
      var response = await postsData.post(id.toString(), postContent.text, currentTime);
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
      postContent.clear();
  }

  
  @override
  viewComments(postsModel) {
    Get.to(() => const CommentView(),
    transition: Transition.cupertino,
    arguments: {"postModel": postsModel}
  );
  }

}