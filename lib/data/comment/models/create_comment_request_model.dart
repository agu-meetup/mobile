class CreateCommentRequestModel {
  int userId;
  int eventId;
  String commentText;

  CreateCommentRequestModel({
    required this.userId,
    required this.eventId,
    required this.commentText,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "event_id": eventId,
      "comment_text": commentText,
    };
  }
}
