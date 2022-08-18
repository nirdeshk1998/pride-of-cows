import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/products/data/models/products_model.dart';

class ProductRepository {
  Future<Response> getProductList(ProductReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.productList, data: reqModel);
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> getCategoryList() async {
    try {
      return await BaseDio.getInstance().post(Endpoint.categoryList);
    } catch (e) {
      throw Exception(e);
    }
  }
}
