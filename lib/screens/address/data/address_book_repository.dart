import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';

class AddressBookRepository {
  Future<Response> addressBookListRepo(String? userId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.addressBookList, data: {FieldConstant.userID: userId});
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateAddressRepo(String? userId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.updateAddress, data: {FieldConstant.userID: userId});
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> saveAddressRepo(String? userId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.saveAddress, data: {FieldConstant.userID: userId});
    } catch (e) {
      throw Exception(e);
    }
  }
}
