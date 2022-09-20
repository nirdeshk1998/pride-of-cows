import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/products/data/models/products_model.dart';

class ProductRepository {
  Future<Response> getProductList(ProductReqModel reqModel) async {
    return await BaseDio.getInstance().post(Endpoint.productList, data: reqModel.toJson());
  }

  Future<Response> getCategoryList() async {
    return await BaseDio.getInstance().post(Endpoint.categoryList);
  }
}
