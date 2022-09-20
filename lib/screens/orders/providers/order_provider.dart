import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/orders/data/models/order_model.dart';
import 'package:poc/screens/orders/data/orders_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final orderProvider = ChangeNotifierProvider.autoDispose<OrderChangeProvider>(
  (ref) => OrderChangeProvider(),
);

class OrderChangeProvider extends BaseChangeNotifier {
  final OrderRepository _orderRepo = OrderRepository();

  String? _userId;
  List<OrderData>? _orderData;

  List<OrderData>? get orderData => _orderData;
  CommonReqModel get _getOrderReqModel => CommonReqModel(
        userId: _userId,
        page: 1,
        limit: 10,
      );

  @override
  Future<void> postCreateState() async {
    await _getPrefs();
    await _getOrderRequest();
  }

  Future<void> _getOrderRequest() async {
    await _orderRepo.getOrder(_getOrderReqModel).then(
      (response) async {
        final result = OrderResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
          _orderData = result.data;
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
