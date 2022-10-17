import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/feedback/data/models/order_place_model.dart';
import 'package:poc/screens/feedback/data/order_place_repo.dart';
import 'package:poc/screens/my_wallet/providers/my_wallet_provider.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final ratingProvider =
ChangeNotifierProvider.autoDispose<RatingProvider>(
      (ref) => RatingProvider(ref),
);
// final ratingProvider =  ChangeNotifierProvider<RatingProvider>((ref)=>RatingProvider()
// );

class RatingProvider extends BaseChangeNotifier {
  RatingProvider(this.ref);
  final AutoDisposeChangeNotifierProviderRef <RatingProvider> ref;


  OrderPlaceRepository orderPlaceRepo=OrderPlaceRepository();
String? _userId;
String ?_orderId;
int ? balance;
  @override
  Future<void> postCreateState() async {


   await ref.read(myWalletProvider).gettingPrefs;
   await ref.read(myWalletProvider).getOfferRequest;
print(await ref.watch(myWalletProvider).balance);
   await _gettingPrefs();
   await _getOrderPlaceData();
  }


   String? get orderId=>_orderId;
  OrderPlaceReqModel get orderPlaceReqModel=>OrderPlaceReqModel(
     userId: _userId.toString(),
    orderType: 'now',
    paymentMethod: '',
    wallet:ref.read(myWalletProvider).balance.toString(),
      );
  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);

  }
  Future<void> _getOrderPlaceData()async{
    return await orderPlaceRepo.getOrderPlaceData(orderPlaceReqModel).then((response){
      final result=OrderPlaceResModel.fromJson(response.data);
      if(response.statusCode==200){
        _orderId=result.orderId;
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        notifyListeners();
      }
      else{
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError(
          (DioError error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.error);
      },
    ).catchError((Object e) {
      showLoader(false);
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }
}
