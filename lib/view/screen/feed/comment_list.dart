import 'package:fexercise/data/model/comments_model.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/feed/comments_controller.dart';

class CommentList extends GetView<CommentsContollerImp> {
  const CommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      height: Get.height / 2.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          //separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.comments.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Comments(
              i: index,
              commentModel:
                  CommentModel.fromJson(controller.comments[index]),
            );
          },
        ),
    );
  }
}

class Comments extends GetView<CommentsContollerImp> {
  final CommentModel commentModel;
  final num? i;
  const Comments({Key? key, required this.commentModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: Get.height / 6,
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
              commentModel.userType == 2 ? FontAwesomeIcons.carrot
            : commentModel.userType == 3 ? FontAwesomeIcons.dumbbell
            : FontAwesomeIcons.user ,
            size: 17,
        ),
        Text(
          " ${commentModel.fname}",
          style: 
          TextStyle(
            fontSize: 17,
            color:
              commentModel.userType == 2 ? Colors.green
            : commentModel.userType == 3 ? Colors.blue
            : textColor,
            ),
        ),
        Text(
          " ${commentModel.lname}",
          style: 
            TextStyle(
              fontSize: 17,
              color: 
              commentModel.userType == 2 ? Colors.green
            : commentModel.userType == 3 ? Colors.blue
            : textColor
            ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Text(
          "${commentModel.commentContent}",
          style: const TextStyle(fontSize: 15),
        ),
      ),
    ),
  ],
),
          ),
        ],
      ),
    );
  }
}

