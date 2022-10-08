import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressInformationProvider= ChangeNotifierProvider.autoDispose<AddressInformationChange>((ref)=>AddressInformationChange());

class AddressInformationChange extends ChangeNotifier{
  bool delInGroupVal=true;
  bool addInGroupVal=true;
  bool doorDelivery=true;
  bool handMeOrder=false;
  bool contactLess=false;
  bool ringBell=true;
  bool notRingBell=false;
  void onChangeDoorDeliveryFun(bool ? value){
    doorDelivery=true;
    handMeOrder=false;
    contactLess=false;
  notifyListeners();
  }
  void onChangeHandMeOrderFun(bool ? value){
    doorDelivery=false;
    handMeOrder=true;
    contactLess=false;
    notifyListeners();
  }
  void onChangeContactLessFun(bool ? value){
    doorDelivery=false;
    handMeOrder=false;
    contactLess=true;
    notifyListeners();
  }
  void onChangeRingBellFun(bool ? value){
    ringBell=true;
    notRingBell=false;
    notifyListeners();
  }
  void onChangeNotRingBellFun(bool ? value){
    ringBell=false;
    notRingBell=true;
    notifyListeners();
  }
}
