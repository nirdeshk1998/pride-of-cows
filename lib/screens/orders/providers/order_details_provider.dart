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

  Future<void> _getPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
