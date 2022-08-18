import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/products/data/models/products_model.dart';

class HomeRepository {
  Future<Response> categoryListRepo() async {
    try {
      return await BaseDio.getInstance().post(Endpoint.categoryList);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> productListRepo(ProductReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.productList, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
