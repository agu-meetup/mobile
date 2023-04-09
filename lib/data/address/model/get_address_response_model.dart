class GetAddressResponseModel {
  int eventId;
  String country;
  String province;
  String district;
  String subLocality;
  String forDirection;
  String locationName;

  GetAddressResponseModel({
    required this.eventId,
    required this.country,
    required this.province,
    required this.district,
    required this.subLocality,
    required this.forDirection,
    required this.locationName,
  });

  factory GetAddressResponseModel.fromJson(Map map) {
    return GetAddressResponseModel(
      eventId: map['event_id'],
      country: map['country'],
      province: map['province'],
      district: map['district'],
      subLocality: map['subLocality'],
      forDirection: map['forDirection'],
      locationName: map['locationName'],
    );
  }
}
