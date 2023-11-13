import '../../../data/address/datasources/address_server_datasource.dart';
import '../../../data/address/model/create_address_request_model.dart';

class AddressRepository {
  /// Attributes
  static List<String> closestAddressLocations = [];

  /// Data Layers
  AddressServerDatasource addressServerDatasource = AddressServerDatasource();

  /// Connect to Data Layer
  Future<void> createAddress(
      CreateAddressRequestModel createAddressRequestModel) async {
    await addressServerDatasource.createAddress(createAddressRequestModel);
  }

  Future<void> getClosestLocationName ({required double lat, required double long}) async {
    print("Lat: $lat, Long: $long");
    if (lat == -1 && long == -1) {
      closestAddressLocations.clear();
      closestAddressLocations = ["KAYSERI", "ANKARA"];
    }
    else {
      print("Fetching locations part");
      List<String> closestLocations = await addressServerDatasource.getClosestLocationName(lat: lat, long: long);
      print("Fetched closest locations: $closestLocations");
      closestAddressLocations.clear();
      closestAddressLocations = [...closestLocations];
    }
  }

  /// Get Static Values from Domain Layer
  List<String> getClosestLocationNameFromStatic() {
    print(closestAddressLocations);
    return closestAddressLocations;
  }
}
