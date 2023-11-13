import 'package:agu_meetup_mobile/data/comment/models/create_comment_request_model.dart';

import '../../../data/comment/datasources/comment_server_datasource.dart';

class CommentRepository {
  /// Data Layers
  CommentServerDatasource detailServerDatasource = CommentServerDatasource();

  Future<void> createComment(
      CreateCommentRequestModel createCommentRequestModel) async {
    await detailServerDatasource.createEvent(createCommentRequestModel);
  }
}