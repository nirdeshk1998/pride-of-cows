import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/offers/data/models/offer_model.dart';

class OfferRepository {
  Future<Response> getOfferList(String? userId) async {
    try {
      return await BaseDio.getInstance().post(
        Endpoint.dealsAndOffers,
        data: {FieldConstant.userID: userId},
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> applyOffer(ApplyOfferReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.applyCoupon, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
