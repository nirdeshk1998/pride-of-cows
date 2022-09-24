import 'package:poc/screens/checkout/checkout_screen.dart';
import 'package:poc/screens/offers/data/models/offer_model.dart';
import 'package:poc/screens/offers/data/offer_repository.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final offerProvider = ChangeNotifierProvider.autoDispose<OfferChangeProvider>(
  (ref) => OfferChangeProvider(),
);

class OfferChangeProvider extends BaseChangeNotifier {
  final OfferRepository _offerRepo = OfferRepository();
  List<DealsOffersData>? _offerList;
  String appliedOffer = "";
  String? _userId;
  int? promoCodeId;

  List<DealsOffersData>? get offerList => _offerList;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _getOfferRequest();
  }

  Future<void> _getOfferRequest() async {
    await _offerRepo.getOfferList(_userId).responseHandler(
      context,
      onSuccess: (response) {
        final result = DealsOffersResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        _offerList = result.data;
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  ApplyOfferReqModel get _applyOfferListModel => ApplyOfferReqModel(
        userId: _userId,
        promoCodeId: promoCodeId,
      );

  void applyOffer(String value, context) async {
    await _offerRepo.applyOffer(_applyOfferListModel).then((response) {
      final result = DealsOffersResModel.fromJson(response.data);
      if (response.statusCode == 200) {
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        appliedOffer = value;
        Utils.push(context, const CheckoutScreen());
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

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  void onRemoveOffer() {
    appliedOffer = "";
    notifyListeners();
  }

  void onPress() {
    showLoader(true);

    showLoader(false);
  }
}
