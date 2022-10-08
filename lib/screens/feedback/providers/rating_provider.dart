import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/feedback/data/models/order_place_model.dart';
import 'package:poc/screens/feedback/data/order_place_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final ratingProvider =
ChangeNotifierProvider.autoDispose<RatingProvider>(
      (ref) => RatingProvider(),
);
// final ratingProvider =  ChangeNotifierProvider<RatingProvider>((ref)=>RatingProvider()
// );

class RatingProvider extends BaseChangeNotifier {
  OrderPlaceRepository orderPlaceRepo=OrderPlaceRepository();
String? _userId;
String ?_orderId;
  @override
  Future<void> postCreateState() async {
   await _gettingPrefs();
   await _getOrderPlaceData();
  }
   String? get orderId=>_orderId;
  OrderPlaceReqModel get orderPlaceReqModel=>OrderPlaceReqModel(
     userId: int.parse(_userId.toString()),
    orderType: "now",
    checkOutAddress: 138,
    paymentMethod: '',
    wallet: '5968',
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
