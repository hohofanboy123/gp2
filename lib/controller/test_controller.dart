import 'package:get/get.dart';

class FeedController extends GetxController {
  RxList<Post> posts = <Post>[].obs;

  void fetchPosts() {
    // Simulate fetching posts from an API or database
    // Replace this with your actual implementation
    final fetchedPosts = [
      Post(
        content: 'Hello, world!',
        author: 'John Doe',
        timestamp: DateTime.now(),
      ),
      // Add more posts here
    ];

    posts.assignAll(fetchedPosts);
  }
}

class Post {
  final String content;
  final String author;
  final DateTime timestamp;

  Post({required this.content, required this.author, required this.timestamp});
}
