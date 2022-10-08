import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/address/data/address_book_repository.dart';
import 'package:poc/screens/address/data/models/addressbook_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final myAddressbookProvider = ChangeNotifierProvider.autoDispose<AddressboookChangeProvider>(
  (ref) => AddressboookChangeProvider(),
);

class AddressboookChangeProvider extends BaseChangeNotifier {
  final AddressBookRepository _addressBookRepo = AddressBookRepository();

  String? _userId;
  List<AddressBookData>? _addressBookData;

  List<AddressBookData>? get addressBookData => _addressBookData;
  Future<void> get addressBookListRequest => _addressBookListRequest();

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _addressBookListRequest();
  }

  Future<void> onDeleteAddressButton(String? aId) async {
    showLoader(true);
    await _deleteAddressRequest(aId);
    showLoader(false);
  }

  Future<void> _addressBookListRequest() async {
    await _addressBookRepo.addressBookListRepo(_userId).responseHandler(
          context,
          onSuccess: (response) {
            final result = AddressBookResModel.fromJson(response.data);

            Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
            _addressBookData = result.data;
          },
          onException: (e, st) => showLoader(false),
        );
  }

  Future<void> _deleteAddressRequest(String? aId) async {
    await _addressBookRepo.deleteAddressRepo(aId).responseHandler(
          context,
          onSuccess: (response) {
            final result = CommonResModel.fromJson(response.data);

            Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          },
          onException: (e, st) => showLoader(false),
        );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
