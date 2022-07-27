import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    ChangeNotifierProvider.autoDispose((ref) => profileChangeProvider());

class profileChangeProvider with ChangeNotifier {
  bool checkState = false;
  bool otpButtonState = false;

  final TextEditingController numberController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController eMailController = TextEditingController();
  void onChangeFun(String value){
    void onChangedFun(String fName,String lName,String phoneNumber,String emailId) {
      if(value.length==10){
        otpButtonState=true;
      }
      else{
        otpButtonState=false;
      }
      notifyListeners();
    }

  }
}
