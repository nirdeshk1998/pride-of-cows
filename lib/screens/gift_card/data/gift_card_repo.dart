import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/gift_card/data/models/gift_card_model.dart';

class GiftCardRepository{
  Future<Response> addGiftCard(AddGiftReqModel reqModel)async{
    try{
      return await BaseDio.getInstance().post(Endpoint.addGiftCard,data: reqModel);
    }
    catch(e){
      throw Exception(e);
    }
  }
}