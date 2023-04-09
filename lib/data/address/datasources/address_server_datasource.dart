import 'dart:convert';

import 'package:agu_meetup_mobile/data/address/model/create_address_request_model.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';
import '../../../core/my_service.dart';
import '../model/get_address_response_model.dart';

class AddressServerDatasource {
  MyService myService = MyService();

  Future<void> createAddress(
      CreateAddressRequestModel createAddressRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/address/createAddress",
      parameters: jsonEncode(createAddressRequestModel.toJson()),
      isRequiredToken: false,
    );

    if (response.statusCode == 201) {
      return;
    }
    else {
      throw CreateAddressError();
    }
  }

  Future<GetAddressResponseModel> getAddressByEventId(int eventId) async {
    print(eventId);
    Response response = await myService.getRequest(
      pathRequest: "api/address/fetchAddressByEventId/$eventId",
      isRequiredToken: false,
    );

    if(response.statusCode == 200){
      return GetAddressResponseModel.fromJson(jsonDecode(response.body)['address']);
    }
    else {
      throw GetAddressError();
    }
  }
}
