import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/address/data/models/save_address_model.dart';

class AddressBookRepository {
  Future<Response> addressBookListRepo(String? userId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.addressBookList, data: {FieldConstant.userID2: userId});
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateAddressRepo(CreateUpdateAddressReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.updateAddress, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> saveAddressRepo(CreateUpdateAddressReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.saveAddress, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteAddressRepo(String? addressId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.deleteAddress, data: {FieldConstant.id: addressId});
    } catch (e) {
      throw Exception(e);
    }
  }
}
