import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editaddressProvider= ChangeNotifierProvider.autoDispose<editaddressChangeProvider>((ref)=>editaddressChangeProvider());

class editaddressChangeProvider extends ChangeNotifier{
  bool home=true;
  bool work=false;
  bool others=false;
  bool defaultAddress=true;
  void onChangeHomeFun(bool ? value){
     home=true;
     work=false;
     others=false;
    notifyListeners();
  }
  void onChangeWorkFun(bool ? value){

    home=false;
    work=true;
    others=false;
    notifyListeners();
  }
  void onChangeOthersFun(bool ? value){

    home=false;
    work=false;
    others=true;
    notifyListeners();
  }
  void onChangeDefaultAddressFun(bool ? value){
    defaultAddress=!defaultAddress;
    notifyListeners();
  }
}