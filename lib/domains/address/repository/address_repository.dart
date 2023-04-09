import '../../../data/address/datasources/address_server_datasource.dart';
import '../../../data/address/model/create_address_request_model.dart';

class AddressRepository {
  /// Data Layers
  AddressServerDatasource detailServerDatasource = AddressServerDatasource();

  Future<void> createAddress(
      CreateAddressRequestModel createAddressRequestModel) async {
    await detailServerDatasource.createAddress(createAddressRequestModel);
  }
}
