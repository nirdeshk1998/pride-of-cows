import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';

class HomeRepository {
  Future<Response> homeDataRepo(String userId) async {
    return await BaseDio.getInstance().post(
        Endpoint.home,
        data: {FieldConstant.userId: userId},
      );
  }
}
