class CommentModel {
  int? commentId;
  int? postId;
  int? userId;
  String? commentContent;
  String? commentDate;
  String? fname;
  String? lname;
  int? userType;

  CommentModel(
      {this.commentId,
      this.postId,
      this.userId,
      this.commentContent,
      this.commentDate,
      this.fname,
      this.lname,
      this.userType});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    postId = json['post_id'];
    userId = json['user_id'];
    commentContent = json['comment_content'];
    commentDate = json['comment_date'];
    fname = json['fname'];
    lname = json['lname'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment_id'] = commentId;
    data['post_id'] = postId;
    data['user_id'] = userId;
    data['comment_content'] = commentContent;
    data['comment_date'] = commentDate;
    data['fname'] = fname;
    data['lname'] = lname;
    data['user_type'] = userType;
    return data;
  }
}