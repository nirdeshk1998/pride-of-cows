import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';

final menuProvider = ChangeNotifierProvider.autoDispose<MenuChangeProvider>((ref) {
  return MenuChangeProvider();
});

class MenuChangeProvider extends BaseChangeNotifier {
  String? _fName, _mNumber;

  String? get fName => _fName;
  String? get mNumber => _mNumber;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
  }

  Future<void> _gettingPrefs() async {
    _fName = await LocalStorage.getString(StorageField.firstName);
    _mNumber = await LocalStorage.getString(StorageField.mobileNumber);
  }
}
