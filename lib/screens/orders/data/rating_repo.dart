import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/orders/data/models/rate_order_model.dart';

class RatingRepository {
  Future<Response> ratingService() {
    return BaseDio.getInstance().post(
      Endpoint.ratingService,
    );
  }

  Future<Response> rateOrder(RateOrderReqModel reqModel) {
    return BaseDio.getInstance().post(
      Endpoint.ratingService,
      data: reqModel,
    );
  }
}
