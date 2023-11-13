import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/comment/models/create_comment_request_model.dart';
import 'package:agu_meetup_mobile/data/comment/models/get_comment_response_model.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';

class CommentServerDatasource {
  MyService myService = MyService();

  Future<void> createEvent(
      CreateCommentRequestModel createCommentRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/createComment",
      parameters: jsonEncode(createCommentRequestModel.toJson()),
      isRequiredToken: false,
    );

    print(response.statusCode);
    print(response.body);

    Map<String, dynamic> responseMap = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return;
    } else {
      throw CreateCommentError();
    }
  }

  Future<List<GetCommentResponseModel>> getCommentsByEventId(int eventId) async {
    Response response = await myService.getRequest(
      pathRequest: "api/getcomments/$eventId",
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['comments'] as List<dynamic>)
          .map((e) => GetCommentResponseModel.fromJson(e))
          .toList();
    } else {
      throw GetCommentError();
    }
  }


}
