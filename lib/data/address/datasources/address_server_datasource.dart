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

  Future<List<String>> getClosestLocationName({required double lat, required double long}) async {
    Map<String, dynamic> queryParams = {
      "lattiude": lat.toString(),
      "longitude": long.toString(),
      "limit": 5.toString(),
    };
    Response response = await myService.getRequest(
        pathRequest: "api/address/closestCitiesAndStreets",
      isRequiredToken: false,
      queryParams: queryParams,
    );
    print("Closest Location response code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['locations'] as List)
                .map((e) => e as String)
                .toList();
    }
    else {
      throw GetClosestLocationName();
    }
  }
}
