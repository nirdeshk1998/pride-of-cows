import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/common_model.dart';

class OrderRepository {
  Future<Response> getOrder(CommonReqModel reqModel) {
    return BaseDio.getInstance().post(
      Endpoint.getOrder,
      data: reqModel.toGetOrderJson(),
    );
  }

  Future<Response> getOrderDetails(CommonReqModel reqModel) {
    return BaseDio.getInstance().post(
      Endpoint.getOrderDetails,
      data: reqModel.toGetOrderDetailsJson(),
    );
  }
}
