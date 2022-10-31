import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/rewards/data/models/reward_model.dart';

class RewardRepository{
  Future<Response> getRewardData(RewardsReqModel reqModel)async{
    return await BaseDio.getInstance().post(Endpoint.rewards,data:reqModel);
  }
}