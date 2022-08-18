import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/products/data/models/category_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';

class ProductRepository {
  Future<ProductResModel> getProductList(ProductReqModel reqModel)async{
    try{
      final response=await BaseDio.getInstance().post(Endpoint.productList,data: reqModel);
      return ProductResModel.fromJson(response.data);
    }
    catch(e){
      throw Exception();
    }
  }
}
class CategoryRepository{
  Future<Response> getCategoryList()async{
    try{
      return await BaseDio.getInstance().post(Endpoint.categoryList);
    }
    catch(e){
      throw Exception(e);
    }
  }
}
