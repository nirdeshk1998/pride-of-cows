import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/common_model.dart';

class WalletRepository {
  Future<Response> getWallatBalance(CommonReqModel reqModel) async {
    return await BaseDio.getInstance().post(
      Endpoint.walletBalance,
      data: reqModel.toWalletBalanceJson(),
    );
  }
}
