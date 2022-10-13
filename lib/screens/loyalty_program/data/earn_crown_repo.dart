import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/loyalty_program/data/models/earn_crown_model.dart';
import 'package:poc/utils/base_provider.dart';

class EarnCrownRepository{
  Future<Response> getEarnCrownData(EarnCrownReqModel reqModel)async{
    return await BaseDio.getInstance().post(Endpoint.earnedCrown,data: reqModel);
  }
}