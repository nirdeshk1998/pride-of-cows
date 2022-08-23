import 'package:dio/dio.dart';
import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';

class HomeRepository {
  Future<Response> homeDataRepo(String userId) async => await BaseDio.getInstance().post(
        Endpoint.home,
        data: {FieldConstant.userId: userId},
      );
}
