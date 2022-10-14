import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/search/data/models/product_search_model.dart';

class SearchRepository {
    Future<Response> productSearch (ProductSearchReqModel reqModel) async {
    return await BaseDio.getInstance().post(
        Endpoint.productSearch,
        data: reqModel.toJson(),
      );
  }
}