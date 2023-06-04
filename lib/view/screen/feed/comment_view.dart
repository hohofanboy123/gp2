import 'package:fexercise/view/widget/divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/feed/comments_controller.dart';
import '../../../essential/classes/data_view_handle.dart';
import '../../../essential/constants/global_constants.dart';
import 'comment_list.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

 @override
  Widget build(BuildContext context) {
    CommentsContollerImp controller = Get.put(CommentsContollerImp());
    return Scaffold(
                  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Comment Page'),
      ),
      body:  Column(
        children: [
          Container(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: Get.height / 4,
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
              controller.postsModel.userType == 2 ? FontAwesomeIcons.carrot
            : controller.postsModel.userType == 3 ? FontAwesomeIcons.dumbbell
            : FontAwesomeIcons.user ,
            size: 17,
        ),
        Text(
          " ${controller.postsModel.fname}",
          style: 
          TextStyle(
            fontSize: 17,
            color:
              controller.postsModel.userType == 2 ? Colors.green
            : controller.postsModel.userType == 3 ? Colors.blue
            : textColor,
            ),
        ),
        Text(
          " ${controller.postsModel.lname}",
          style: 
            TextStyle(
              fontSize: 17,
              color: 
              controller.postsModel.userType == 2 ? Colors.green
            : controller.postsModel.userType == 3 ? Colors.blue
            : textColor
            ),
        ),
        Spacer(),
        Text(
          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(controller.postsModel.postTime!)),
          ),
      ],
    ),
    SizedBox(height: 15,),
    Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Text(
          "${controller.postsModel.postContent}",
          style: const TextStyle(fontSize: 15),
        ),
      ),
    ),
  ],
),
          ),
        ],
      ),
    ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
                width: Get.width / 1.3,
                child: TextField(
                  controller: controller.commentContent,
                  decoration: InputDecoration(
                    hintText: "Add a comment",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                  ),
                  maxLines: 2,
                  maxLength: 250,
                ),
              ),
              IconButton(
                onPressed: (){
                  controller.commentAComment();
                },
                icon: FaIcon(FontAwesomeIcons.arrowRight)
              ),
            ],
          ),
          CustomDivider(
            text: "Comments"
          ),
          GetBuilder<CommentsContollerImp>(
              builder: (controller) => ReqViewHandle(
                statusRequest: controller.statusRequest,
                widget:CommentList(),
              )
          )
        ],
      ),
      );
  }
}