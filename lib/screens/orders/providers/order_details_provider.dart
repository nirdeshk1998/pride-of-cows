import 'package:flutter/cupertino.dart';
import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/orders/data/models/order_details_model.dart';
import 'package:poc/screens/orders/data/models/rate_order_model.dart';
import 'package:poc/screens/orders/data/models/rating_service_model.dart';
import 'package:poc/screens/orders/data/orders_repo.dart';
import 'package:poc/screens/orders/data/rating_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final orderDetailsProvider = ChangeNotifierProvider.autoDispose<OrderDetailsProvider>(
  (ref) => OrderDetailsProvider(),
);

class OrderDetailsProvider extends BaseChangeNotifier {
  final OrderRepository _orderRepo = OrderRepository();
  final RatingRepository _ratingRepo = RatingRepository();

  final TextEditingController _reasonController = TextEditingController();

  String? _userId, _orderId;
  OrderDetailsData? _orderDetailsData;
  List<RatingServices>? _ratingServiceData;
  int? _productRating, _deliveryRating;
  List<bool>? _likedServices;

  TextEditingController get reasonController => _reasonController;
  OrderDetailsData? get orderDetailsData => _orderDetailsData;
  List<RatingServices>? get ratingServiceData => _ratingServiceData;
  CommonReqModel get _getOrderReqModel => CommonReqModel(
        userId: _userId,
        orderId: _orderId,
      );

  RateOrderReqModel get _rateOrderReqModel => RateOrderReqModel(
        userID: _userId,
        rate: _productRating ?? 0,
        delRate: _deliveryRating ?? 0,
        orderId: int.parse(_orderId ?? ''),
        message: _reasonController.text,
        likedServices: LikedServicesReqModel(
          i0: _likedServices?[0] == true ? 1 : 0,
          i1: _likedServices?[1] == true ? 1 : 0,
          i2: _likedServices?[2] == true ? 1 : 0,
          i3: _likedServices?[3] == true ? 1 : 0,
        ),
      );

  @override
  Future<void> postCreateState() async {
    _orderId = data.toString();

    await _getPrefs();
    await _getOrderDetailsRequest();
  }

  Future<void> onSubmitRatingButton() async {
    showLoader(true);
    await _rateOrderRequest();
    showLoader(false);
  }

  void onProductExpRate(int val) => _productRating = val;

  void onDeliveryExpRate(int val) => _deliveryRating = val;

  void onLikedServiceChanged(List<bool> list) => _likedServices = list;

  Future<void> _getOrderDetailsRequest() async {
    await _orderRepo.getOrderDetails(_getOrderReqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = OrderDetailsResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        _orderDetailsData = result.data;
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> ratingServiceRequest() async {
    showLoader(true);
    await _ratingRepo.ratingService().responseHandler(
      context,
      onSuccess: (response) {
        showLoader(false);

        final result = RatingServiceResModel.fromJson(response.data);

        _ratingServiceData = result.ratingServices;
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _rateOrderRequest() async {
    showLoader(true);
    await _ratingRepo.rateOrder(_rateOrderReqModel).responseHandler(
      context,
      onSuccess: (response) {
        showLoader(false);

        final result = CommonResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _getPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
