import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';

final referEarnProvider = ChangeNotifierProvider<ReferEarnNotifier>(
  (ref) => ReferEarnNotifier(),
);

class ReferEarnNotifier extends BaseChangeNotifier {
  String? _referralCode;
  String? get referralCode => _referralCode;

  @override
  Future<void> postCreateState() async {
    _referralCode = await LocalStorage.getString(StorageField.referralCode);
  }
}
