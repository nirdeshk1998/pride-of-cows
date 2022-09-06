import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/offers/data/models/offer_model.dart';


class OfferRepository{
  Future<Response> getOfferList(OfferReqModel reqModel)async{
    try{
      print(reqModel);
      return await BaseDio.getInstance().post(Endpoint.dealsAndOffers,data: reqModel);
    }
    catch(e){
      throw Exception(e);
    }
    
  }

  Future<Response> applyOffer(ApplyOfferReqModel reqModel)async{
    try{
      return await BaseDio.getInstance().post(Endpoint.applyCoupon,data: reqModel);
    }
    catch(e){
      throw Exception(e);
    }
  }
}