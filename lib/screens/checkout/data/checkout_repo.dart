import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/checkout/data/models/checkout_model.dart';


class CheckoutRepository{
  Future<Response> getCheckOutList(CheckoutReqModel reqModel)async{

      return await BaseDio.getInstance().post(Endpoint.checkout,data: reqModel.toJson());


  }
}
