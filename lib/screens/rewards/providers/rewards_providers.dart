import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/rewards/data/models/reward_model.dart';
import 'package:poc/screens/rewards/data/rewards_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final rewardProvider = ChangeNotifierProvider<RewardChangeProvider>((ref) => RewardChangeProvider());

class RewardChangeProvider extends BaseChangeNotifier{
  final RewardRepository rewardRepository=RewardRepository();


  bool rewardsTabIsPressed=true;
  bool historyTabIsPressed=false;
  String?_userId;
  int? rewardPointBalance;
  List<RewardData>? rewards;
  List<RedeemedRewardsData>? redeemedRewards;
  int? noOfPages;
  @override
  Future<void> postCreateState() async {
   await _gettingPrefs();
   await getRewardData();
  }
  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
  RewardsReqModel get reqModel=>RewardsReqModel(
    userId: _userId,
    page: 1,
    perPage: 5
  );
  Future<void> getRewardData()async{
    await rewardRepository.getRewardData(reqModel).then((response){
      final result=RewardsResModel.fromJson(response.data);
      if(response.statusCode==200){
        rewardPointBalance=result.rewardPointBalance;
        rewards=result.rewards;
      redeemedRewards=result.redeemedRewards;
      noOfPages=result.noOfPages;
      }
      else{}
    }).onError(
          (DioError error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.debug);
      },
    ).catchError((Object e) {
      showLoader(false);
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }



  onRewardTabPressed(){
    rewardsTabIsPressed=true;
    historyTabIsPressed=false;
    notifyListeners();
  }


   onHistoryTabPressed(){
    rewardsTabIsPressed=false;
    historyTabIsPressed=true;
    notifyListeners();
  }
}