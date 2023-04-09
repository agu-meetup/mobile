class CreateAddressRequestModel {
  String country;
  String province;
  String district;
  String subLocality;
  String forDirection;
  String locationName;
  int eventId;

  CreateAddressRequestModel({
    required this.country,
    required this.province,
    required this.district,
    required this.subLocality,
    required this.forDirection,
    required this.locationName,
    required this.eventId,
  });

  Map<String, dynamic> toJson() {
    return {
      "country": country,
      "province": province,
      "district": district,
      "subLocality": subLocality,
      "forDirection": forDirection,
      "locationName": locationName,
      "event_id": eventId,
    };
  }
}
