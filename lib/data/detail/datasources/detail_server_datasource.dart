import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';
import '../models/get_detail_by_id_response_model.dart';

class DetailServerDatasource {
  MyService myService = MyService();

  Future<GetDetailByIdResponseModel> getDetailById(int detailId) async {
    Response response = await myService.getRequest(
      pathRequest: "api/detail/$detailId",
      isRequiredToken: false,
    );

    if (response.statusCode == 200){
      return GetDetailByIdResponseModel.fromJson(jsonDecode(response.body)['detail']);
    }
    else {
      throw GetDetailByIdError();
    }
  }
}