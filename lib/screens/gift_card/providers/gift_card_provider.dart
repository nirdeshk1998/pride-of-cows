import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final giftCardProvider = ChangeNotifierProvider.autoDispose<GiftCardChangeProvider>((ref) {
  return GiftCardChangeProvider();
});

class GiftCardChangeProvider extends ChangeNotifier {
  double _widgetHeight = 0.0;
  double get widgetHight => _widgetHeight;

  int _selectedGiftCard = 0;
  int get selectedGiftCard => _selectedGiftCard;

  bool rName=false;
  bool sName=false;

  bool rPhNo=false;
  bool sPhNo=false;

  bool rEmailId=false;
  bool sEmailId=false;

  bool saveButtonState=false;

  void onSizeChange(Size i) {
    _widgetHeight = i.height;
  }

  void onGiftCardChangeFun(int i) {
    _selectedGiftCard = i;
    notifyListeners();
  }

  void onChangeRNameFun(String value) {
    if (value.length == 0) {
      rName = false;
    } else {
      rName = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeRPhNoFun(String value) {
    if (value.length < 10) {
      rPhNo = false;
    } else {
      rPhNo = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeREmailFun(String value) {
    if (value.length == 0) {
      rEmailId = false;
    } else {
      rEmailId = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeSNameFun(String value) {
    if (value.length == 0) {
      sName = false;
    } else {
      sName = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeSPhNoFun(String value) {
    if (value.length < 10) {
      sPhNo = false;
    } else {
      sPhNo = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeSEmailFun(String value) {
    if (value.length == 0) {
      sEmailId = false;
    } else {
      sEmailId = true;
      onAllChangeFun();
    }
    notifyListeners();
  }



  void onAllChangeFun(){
    print(rName);
    print(sName);
    print(rPhNo);
    print(sPhNo);
    print(rEmailId);
    print(sEmailId);
    if(rName&&sName&&rPhNo&&sPhNo&&rEmailId&&sEmailId){

      saveButtonState=true;
    }
    else{
      saveButtonState=false;
    }
    notifyListeners();
  }
}
