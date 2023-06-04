import 'package:fexercise/data/model/posts_model.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/screen/welcome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/feed/posts_controller.dart';

class PostList extends GetView<PostsControllerImp> {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height / 1.4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          //separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.posts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Posts(
              i: index,
              postsModel:
                  PostsModel.fromJson(controller.posts[index]),
            );
          },
        ),
    );
  }
}

class Posts extends GetView<PostsControllerImp> {
  final PostsModel postsModel;
  final num? i;
  const Posts({Key? key, required this.postsModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: Get.height / 3,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5)
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Row(
      children: [
        FaIcon(
              postsModel.userType == 2 ? FontAwesomeIcons.carrot
            : postsModel.userType == 3 ? FontAwesomeIcons.dumbbell
            : FontAwesomeIcons.user ,
            size: 17,
        ),
        Text(
          " ${postsModel.fname}",
          style: 
          TextStyle(
            fontSize: 17,
            color:
              postsModel.userType == 2 ? Colors.green
            : postsModel.userType == 3 ? Colors.blue
            : textColor,
            ),
        ),
        Text(
          " ${postsModel.lname}",
          style: 
            TextStyle(
              fontSize: 17,
              color: 
              postsModel.userType == 2 ? Colors.green
            : postsModel.userType == 3 ? Colors.blue
            : textColor
            ),
        ),
        const Spacer(),
        Text(
          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(postsModel.postTime!)),
          ),
      ],
    ),
    const SizedBox(height: 15,),
    Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Text(
          "${postsModel.postContent}",
          style: const TextStyle(fontSize: 15),
        ),
      ),
    ),
    Row(
      children: [
        CustomCommentButton(
          text: "Comment",
          press: (){
           controller.viewComments(postsModel);
          })
      ],
    )
  ],
),
          ),
        ],
      ),
    );
  }
}

