import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/cart/data/models/cart_add_model.dart';
import 'package:poc/screens/cart/data/models/get_cart_model.dart';
import 'package:poc/screens/cart/data/models/remove_from_cart_model.dart';

class CartRepository {
  Future<Response> addToCartRepo(AddCartReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.addToCart, data: reqModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> userCartRepo(UserCartReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.userCartList, data: reqModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> removeFromCartRepo(RemoveFromCartReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.removeFromCart, data: reqModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }
}
