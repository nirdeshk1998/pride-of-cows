import 'package:dio/dio.dart';
import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';

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

  Future<Response> pincodeListRepo(String cityId) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.pincodeList, data: {FieldConstant.cityId: cityId});
    } catch (e) {
      throw Exception(e);
    }
  }
}
