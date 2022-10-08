import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/feedback/data/models/order_place_model.dart';

// class OrderPlaceRepository{
//   Future<Response> getOrderPlaceData(OrderPlaceReqModel reqModel)async{
//     return await BaseDio.getInstance().post(Endpoint.validateOrderPlace,data:reqModel.toJson() );
//   }
// }

class OrderPlaceRepository{
  Future<Response> getOrderPlaceData(OrderPlaceReqModel reqModel)async{

    return await BaseDio.getInstance().post(Endpoint.validateOrderPlace,data: reqModel.toJson());


  }
}
