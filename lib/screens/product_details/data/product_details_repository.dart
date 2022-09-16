import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/product_details/data/models/product_details_model.dart';

class ProductDetailsRepository {
  Future<Response> productDetailsRepo(ProductDetailsReqModel reqModel) async {
    return await BaseDio.getInstance().post(
      Endpoint.productDetails,
      data: reqModel.toJson(),
    );
  }
}
