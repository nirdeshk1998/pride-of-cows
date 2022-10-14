import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';

class HomeRepository {

  // List<String> get weekNameList => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  
  Future<Response> homeDataRepo(String userId) async {
    return await BaseDio.getInstance().post(
        Endpoint.home,
        data: {FieldConstant.userId: userId},
      );
  }
}
