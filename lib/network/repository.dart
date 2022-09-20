import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';

class ListDataRepository {
  Future<Response> stateListRepo() async => await BaseDio.getInstance().post(
        Endpoint.stateList,
      );

  Future<Response> cityListRepo(String stateId) async => await BaseDio.getInstance().post(
        Endpoint.cityList,
        data: {FieldConstant.stateId: stateId},
      );

  Future<Response> pincodeDataRepo(int pincode) async => await BaseDio.getInstance().post(
        Endpoint.pincodeList,
        data: {FieldConstant.pincode: pincode},
      );

  Future<Response> availablePincodeRepo(String userId) async => await BaseDio.getInstance().post(
        Endpoint.availablePincodeList,
        data: {FieldConstant.userID2: userId},
      );
}
