import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/refer_&_earn/data/models/refer_&_earn_model.dart';

class ReferalHistoryRepository{
  Future<Response> referalHistoryData(ReferalHistoryReqModel reqModel)async{
    return await BaseDio.getInstance().post(Endpoint.refferalHistory,data: reqModel);
  }
}