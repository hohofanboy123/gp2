import 'package:fexercise/controller/feed/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../essential/classes/data_view_handle.dart';
import '../feed/post_list.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(PostsControllerImp());
    return GetBuilder<PostsControllerImp>(
              builder: (controller) => DataViewHandle(
                statusRequest: controller.statusRequest,
                widget:Scaffold(
                  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Feed Page'),
      ),
      body:  Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
                width: Get.width / 1.3,
                child: TextField(
                  controller: controller.postContent,
                  decoration: InputDecoration(
                    hintText: "Whats on your mind?",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                  ),
                  maxLines: 2,
                  maxLength: 500,
                ),
              ),
              IconButton(
                onPressed: (){
                  controller.postAPost();
                },
                icon: const FaIcon(FontAwesomeIcons.arrowRight)
              ),
            ],
          ),
          const PostList(),
        ],
      )),
    ));
  }
}
