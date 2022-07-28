import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/utils/utils.dart';

final profileProvider =
    ChangeNotifierProvider.autoDispose((ref) => profileChangeProvider());

class profileChangeProvider with ChangeNotifier {
  bool saveButtonState = false;
  bool fname = false;
  bool lName = false;
  bool phNo = false;
  bool gender = false;
  bool emailId = false;
  bool dob = false;

  final TextEditingController numberController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  void onSendOtpButton(context) {
    Utils.push(context, const MenuScreen());
  }

  void onChangeFNameFun(String value) {
    if (value.length == 0) {
      fname = false;
    } else {
      fname = true;
      onAllChangeFun();
    }
    notifyListeners();
  }


  void onChangeLNameFun(String value) {
    if (value.length == 0) {
      lName = false;
    } else {
      lName = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangePhNoFun(String value) {
    if (value.length < 10) {
      phNo = false;
    } else {
      phNo = true;
      onAllChangeFun();
    }
    notifyListeners();
  }
  void onChangeGenderFun(int ? value) {
    if (value==null) {
      gender = false;
    } else {
      gender = true;
      onAllChangeFun();
    }
    notifyListeners();
  }
  void onChangeEmailFun(String value) {
    if (value.length == 0) {
      emailId = false;
    } else {
      emailId = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeDobFun(String value) {
    if (value.length == 0) {
      dob = false;
    } else {
      dob = true;
      onAllChangeFun();
    }
    notifyListeners();
  }
  void onAllChangeFun(){
    if(fname&&lName&&phNo&&gender&&emailId){
      saveButtonState=true;
    }
    else{
      saveButtonState=false;
    }
  }
}
