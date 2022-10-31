import 'package:dio/dio.dart';
import 'package:poc/screens/refer_&_earn/data/models/refer_&_earn_model.dart';
import 'package:poc/screens/refer_&_earn/data/refer_&_earn_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final referEarnProvider = ChangeNotifierProvider<ReferEarnNotifier>((ref) => ReferEarnNotifier());

class ReferEarnNotifier extends BaseChangeNotifier {
  String? _referralCode;
  String? get referralCode => _referralCode;
  String? _userId;
  ReferalHistoryRepository _referalHistoryRepo=ReferalHistoryRepository();
  List<ReferalHistoryData>? _referalHistoryData;
  List<ReferalHistoryData>? get referalHistoryData=>_referalHistoryData;

  @override
  Future<void> postCreateState() async {
    _referralCode = await LocalStorage.getString(StorageField.referralCode);
    await _gettingPrefs();
  await  getReferalHistoryData();
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  ReferalHistoryReqModel get reqModel=>ReferalHistoryReqModel(
    userId: _userId,
  );
  Future<void> getReferalHistoryData()async{
    return await _referalHistoryRepo.referalHistoryData(reqModel).then((response){
      final result=ReferalHistoryResModel.fromJson(response.data);
      if(response.statusCode==200){
        _referalHistoryData=result.data;
      }
      else{}
    }).onError(
          (DioError error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.debug);
      },
    ).catchError((Object e) {
      showLoader(false);
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }
}
