import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/screens/offers/data/models/offer_model.dart';
import 'package:poc/screens/offers/data/offer_repository.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final offerProvider = ChangeNotifierProvider.autoDispose<OfferChangeProvider>(
      (ref) => OfferChangeProvider(),
);

class OfferChangeProvider extends ChangeNotifier{
  final OfferRepository _offerRepo = OfferRepository();
  List <OfferData>? _offerList;
  String appliedOffer="";
  int ?_userId;
  bool _isLoading=false;
  int ? promoCodeId;


  List<OfferData>? get offerList=>_offerList;
  bool get loading=>_isLoading;

  Future<void>initState(BuildContext context)async{
    showLoader(true);
   await _gettingPrefs();
   await  _getOffer(context);
    showLoader(false);
  }


  Future<void> _gettingPrefs()async{
    _userId=int.parse((await LocalStorage.getString(StorageField.userId)).toString());
    notifyListeners();
  }
  OfferReqModel get _offerListModel=>OfferReqModel(
    userId:_userId,
  );
  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _getOffer(context)async{
    await _offerRepo.getOfferList(_offerListModel).then((response){
      final result=OfferResModel.fromJson(response.data);
        if (response.statusCode == 200) {
          _offerList = result.data;
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }

    }).onError(
          (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.toString(), type: SnackType.debug);
      },
    );
    notifyListeners();
  }

  ApplyOfferReqModel get _applyOfferListModel=>ApplyOfferReqModel(
    userId: _userId,
    promoCodeId: promoCodeId,
  );


  void applyOffer(String value,context)async{
    await _offerRepo.applyOffer(_applyOfferListModel).then((response){
      final result=ApplyOfferResModel.fromJson(response.data);
      if (response.statusCode == 200) {
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        appliedOffer=value;
        Utils.push(context,  CartSummary());
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
      }
    }).onError(
          (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.toString(), type: SnackType.debug);
      },
    );
    notifyListeners();
  }
  void onRemoveOffer(){
    appliedOffer="";
    notifyListeners();
  }
}
