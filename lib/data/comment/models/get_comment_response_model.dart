class GetCommentResponseModel {
  String userName;
  String commentText;

  GetCommentResponseModel({required this.userName, required this.commentText});

  factory GetCommentResponseModel.fromJson(Map map) {
    return GetCommentResponseModel(
      userName: map["name"],
      commentText: map["comment_text"],
    );
  }
}
