import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/orders/data/models/order_details_model.dart';
import 'package:poc/screens/orders/data/orders_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final orderDetailsProvider = ChangeNotifierProvider.autoDispose<OrderDetailsChangeProvider>(
  (ref) => OrderDetailsChangeProvider(),
);

class OrderDetailsChangeProvider extends BaseChangeNotifier {
  final OrderRepository _orderRepo = OrderRepository();

  String? _userId, _orderId;
  OrderDetailsData? _orderDetailsData;

  OrderDetailsData? get orderDetailsData => _orderDetailsData;
  CommonReqModel get _getOrderReqModel => CommonReqModel(
        userId: _userId,
        orderId: _orderId,
      );

  @override
  Future<void> postCreateState() async {
    _orderId = data.toString();

    await _getPrefs();
    await _getOrderDetailsRequest();
  }

  Future<void> _getOrderDetailsRequest() async {
    await _orderRepo.getOrderDetails(_getOrderReqModel).then(
      (response) async {
        final result = OrderDetailsResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
          _orderDetailsData = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.debug);
      },
    ).catchError(
      (Object e) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  Future<void> _getPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
