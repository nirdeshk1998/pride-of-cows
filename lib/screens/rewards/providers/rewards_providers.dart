import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rewardProvider=ChangeNotifierProvider.autoDispose<RewardChangeProvider>((ref) => RewardChangeProvider());
class RewardChangeProvider extends ChangeNotifier{
  bool rewardsTabIsPressed=true;
  bool historyTabIsPressed=false;
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