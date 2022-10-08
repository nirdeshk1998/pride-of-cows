import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/cart/data/models/cart_add_model.dart';
import 'package:poc/screens/cart/data/models/get_cart_model.dart';
import 'package:poc/screens/cart/data/models/remove_from_cart_model.dart';

class CartRepository {
  Future<Response> addToCartRepo(AddCartReqModel reqModel) async {
    return await BaseDio.getInstance().post(
      Endpoint.addToCart,
      data: reqModel.toJson(),
    );
  }

  Future<Response> userCartRepo(UserCartReqModel reqModel) async {
    return await BaseDio.getInstance().post(
      Endpoint.userCartList,
      data: reqModel.toJson(),
    );
  }

  Future<Response> removeFromCartRepo(RemoveFromCartReqModel reqModel) async {
    return await BaseDio.getInstance().post(
      Endpoint.removeFromCart,
      data: reqModel.toJson(),
    );
  }
}
