import 'package:flutter/cupertino.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/loyalty_program/data/earn_crown_repo.dart';
import 'package:poc/screens/loyalty_program/data/models/earn_crown_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final earnCrownProvider =
    ChangeNotifierProvider.autoDispose<EarnCrownChangeNotifier>((ref) {
  return EarnCrownChangeNotifier();
});

class EarnCrownChangeNotifier extends BaseChangeNotifier {
  final EarnCrownRepository _earnCrownRepository = EarnCrownRepository();
  String? _userId;
  List<RewardData>? rewardList;
  int? balanceLeft;
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _getEarnCrownList();
  }

  EarnCrownReqModel get _earnCrownReqModel => EarnCrownReqModel(
        userId: _userId,
      );

  Future<void> _getEarnCrownList() async {
    return await _earnCrownRepository
        .getEarnCrownData(_earnCrownReqModel)
        .then((response) {
      final result = EarnCrownResModel.fromJson(response.data);
      if (response.statusCode == 200) {
        rewardList=result.reward;
        balanceLeft=result.rewardPointBalance;

        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.success);
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

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
    notifyListeners();
  }
}
