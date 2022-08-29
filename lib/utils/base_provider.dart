import 'package:flutter/material.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  @protected
  late BuildContext context;
  bool isLoading = false;

  bool _isCreated = false;

  onCreate(BuildContext context) async {
    this.context = context;
    if (!_isCreated) {
      _isCreated = true;

      showLoader(true);
      await postCreate();
      showLoader(false);
    }
  }

  Future<void> postCreate();

  void showLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
