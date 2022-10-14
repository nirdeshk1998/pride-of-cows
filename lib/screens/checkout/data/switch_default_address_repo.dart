
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/checkout/data/models/checkout_model.dart';

class SwitchDefaultAddressRepository{
  Future<Response> switchDefaultAddress(SwitchDefaultAddressReqModel reqModel)async{

    return await BaseDio.getInstance().post(Endpoint.switchDefaultAddress,data: reqModel.toJson());
  }
}