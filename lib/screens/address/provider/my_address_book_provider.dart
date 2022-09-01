import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
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

  Future<void> _addressBookListRequest() async {
    await _addressBookRepo.addressBookListRepo(_userId).then(
      (response) async {
        final result = AddressBookResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);

          _addressBookData = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  // Future<void> _saveAddressRequest() async {
  //   await _addressBookRepo.saveAddressRepo(_userId).then(
  //     (response) async {
  //       final result = AddressBookResModel.fromJson(response.data);

  //       if (response.statusCode == 200) {
  //         Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
  //       } else {
  //         Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
  //       }
  //     },
  //   ).onError(
  //     (DioError error, stackTrace) {
  //       debugPrint('error: ${error.type}');
  //       showLoader(false);

  //       Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
  //     },
  //   );
  // }

  // Future<void> _updateAddressRequest() async {
  //   await _addressBookRepo.updateAddressRepo(_userId).then(
  //     (response) async {
  //       final result = AddressBookResModel.fromJson(response.data);

  //       if (response.statusCode == 200) {
  //         Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
  //       } else {
  //         Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
  //       }
  //     },
  //   ).onError(
  //     (DioError error, stackTrace) {
  //       debugPrint('error: ${error.type}');
  //       showLoader(false);

  //       Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
  //     },
  //   );
  // }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  // void onAddNewAddressButton() {
  //   Utils.push(
  //     context,
  //     const CreateUpdateAddressScreen(addressType: AddressType.add),
  //   ).whenComplete(() async {
  //     showLoader(true);
  //     await _addressBookListRequest();
  //     showLoader(false);
  //   });
  // }
}
