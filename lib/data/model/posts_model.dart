class PostsModel {
  int? postId;
  int? postUserId;
  String? postContent;
  String? postTime;
  String? fname;
  String? lname;
  int? userType;

  PostsModel(
      {this.postId,
      this.postUserId,
      this.postContent,
      this.postTime,
      this.fname,
      this.lname,
      this.userType});

  PostsModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postUserId = json['post_user_id'];
    postContent = json['post_content'];
    postTime = json['post_time'];
    fname = json['fname'];
    lname = json['lname'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['post_user_id'] = postUserId;
    data['post_content'] = postContent;
    data['post_time'] = postTime;
    data['fname'] = fname;
    data['lname'] = lname;
    data['user_type'] = userType;
    return data;
  }
}