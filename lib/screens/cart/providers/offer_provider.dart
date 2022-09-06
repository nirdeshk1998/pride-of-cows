// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:poc/screens/cart/data/models/offer_model.dart';
// import 'package:poc/screens/cart/data/offer_repository.dart';
// import 'package:poc/screens/cart/providers/cart_provider.dart';
// import 'package:poc/utils/local_storage.dart';
//
// final offerProvider=ChangeNotifierProvider.autoDispose<CartChangeProvider>(
//     (ref)=>OfferChangeProvider(),
// );
// class OfferChangeProvider extends ChangeNotifier{
//   final OfferRepository _offerRepo = OfferRepository();
//   List <OfferData> _offerList=[];
//   String? userId;
//
//   Future<void>initState(BuildContext context)async{
//     await _gettingPrefs(context);
//     await _getOffer(context);
//   }
//
//   Future<void> _gettingPrefs(context)async{
//     userId=await LocalStorage.getString(StorageField.userId);
//     notifyListeners();
//   }
//
//   OfferReqModel get _offerListModel=>OfferReqModel(
//     userId:int.parse(userId.toString()),
//   );
//
//   Future<void> _getOffer(context)async{
//     await _offerRepo.getOfferList(_offerListModel).then((response){
//       final result=OfferResModel.fromJson(response.data);
//       print(response);
//     });
//   }
//
//
// }
