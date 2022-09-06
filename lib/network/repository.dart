import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';

class ListDataRepository {
  Future<Response> stateListRepo() async {
    try {
      return await BaseDio.getInstance().post(Endpoint.stateList);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> cityListRepo(String stateId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.cityList, data: {FieldConstant.stateId: stateId});
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> pincodeDataRepo(int pincode) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.pincodeList, data: {FieldConstant.pincode: pincode});
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> availablePincodeRepo(String userId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.availablePincodeList, data: {FieldConstant.userID: userId});
    } catch (e) {
      throw Exception(e);
    }
  }
}
