import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/my_wallet/data/models/wallet_balance_model.dart';
import 'package:poc/screens/my_wallet/data/wallet_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';

final myWalletProvider = ChangeNotifierProvider.autoDispose<MyWalletChangeProvider>((ref) {
  return MyWalletChangeProvider();
});

class MyWalletChangeProvider extends BaseChangeNotifier {
  final WalletRepository _walletRepo = WalletRepository();

  String? _userId;
  int? _numOfPages;
  Wallet? _wallet;
  List<CwalletTransactions>? _cWalletTrans;

  int? get numOfPages => _numOfPages;
  Wallet? get wallet => _wallet;
  List<CwalletTransactions>? get cWalletTrans => _cWalletTrans;

  CommonReqModel get _walletBalanceReqModel => CommonReqModel(
        userId: _userId,
        page: 1,
        perPage: 20,
      );

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _getOfferRequest();
  }

  Future<void> _getOfferRequest() async {
    await _walletRepo.getWallatBalance(_walletBalanceReqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = WalletBalanceResModel.fromJson(response.data);

        _cWalletTrans = result.cwalletTransactions;
        _numOfPages = result.noPages;
        _wallet = result.wallet;

        // Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
