
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/gift_card/data/gift_card_repo.dart';
import 'package:poc/screens/gift_card/data/models/gift_card_model.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final giftCardProvider = ChangeNotifierProvider.autoDispose<GiftCardChangeProvider>((ref) {
  return GiftCardChangeProvider();
});

class GiftCardChangeProvider extends ChangeNotifier {
  final GiftCardRepository _giftCardRepo=GiftCardRepository();

  final double _widgetHeight = 0.0;
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

  String  selectedAmount='₹500';

  int? _userId;
String? pinCode;
String? countryCode;

  TextEditingController recipientNameController=TextEditingController();
  TextEditingController recipientPhController=TextEditingController();
  TextEditingController recipientEmailController=TextEditingController();
  TextEditingController sendersNameController=TextEditingController();
  TextEditingController sendersPhController=TextEditingController();
  TextEditingController sendersEmailIdController=TextEditingController();
  TextEditingController sendersMessageController=TextEditingController();
  List<String> giftAmountList=['₹500',
    '₹1000',
    '₹2000',
    '₹2500',
    '₹5000',];
  List<String> giftTypeList=[
    'e-gift card',
    'physical gift card',
    'gift a subscription',
  ];

  int giftAmpuntSelectedIndex=0;
  String? giftCardType;

  // void onSizeChange(Size i) {
  //   _widgetHeight = i.height;
  // }

  Future<void> initState(BuildContext context) async{
   await _gettingPrefs();

  }

  AddGiftReqModel get reqModel=>AddGiftReqModel(
    userId: _userId,
    giftAmount: selectedAmount.substring(1),
    giftCardType:giftCardType=='e-gift card'?giftCardType='egift':giftCardType=='physical gift card'?giftCardType='physical':giftCardType='gift',
    recipeintName:recipientNameController.text,
    recipeintPhone: recipientPhController.text,
    recipeintEmail: recipientEmailController.text,
    sendersName: sendersNameController.text,
    recipeintPinCode: '200890',
    recipeintCountryCode: '+91',
    sendersEmail: sendersEmailIdController.text,
    sendersMessage: sendersMessageController.text
  );
  Future<void> addGiftCard(context)async{
    await _giftCardRepo.addGiftCard(reqModel).then((response)async{
      final result=AddGiftResModel.fromJson(response.data);
      print(response);
      if(response.statusCode==200){
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      }
      else{
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
      }
    }).onError((error, stackTrace){
      Utils.showPrimarySnackbar(context, stackTrace.toString(), type: SnackType.error);
    });
  }

  Future<void> _gettingPrefs()async{
    _userId=int.parse((await LocalStorage.getString(StorageField.userId)).toString());
    notifyListeners();
  }

  void onGiftCardChangeFun(int i,String cardType) {
    _selectedGiftCard = i;
    giftCardType=cardType;
    notifyListeners();
  }

  void onChangeRNameFun(String value) {
    if (value.isEmpty) {
      rName = false;
    }
    else{
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
    if (value.isEmpty) {
      rEmailId = false;
    } else {
      rEmailId = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

  void onChangeSNameFun(String value) {
    if (value.isEmpty) {
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
    if (value.isEmpty) {
      sEmailId = false;
    } else {
      sEmailId = true;
      onAllChangeFun();
    }
    notifyListeners();
  }

void onSelectAmount(int index,String amount){
  giftAmpuntSelectedIndex=index;
  selectedAmount=amount;
  notifyListeners();
}
  void onAllChangeFun(){
    if(rName&&sName&&rPhNo&&sPhNo&&rEmailId&&sEmailId){
      saveButtonState=true;
    }
    else{
      saveButtonState=false;
    }
    notifyListeners();
  }
}