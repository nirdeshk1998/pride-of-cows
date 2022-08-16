import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';

class HomeRepository {
  Future<Response> categoryListRepo() async {
    try {
      return await BaseDio.getInstance().post(Endpoint.categoryList);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> productListRepo() async {
    try {
      return await BaseDio.getInstance().post(Endpoint.productList);
    } catch (e) {
      throw Exception(e);
    }
  }
}
