import 'package:flutter/material.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  @protected
  late BuildContext _context;
  bool _isLoading = false;
  bool _isCreated = false;

  BuildContext get context => _context;
  bool get isLoading => _isLoading;

  void initState(BuildContext context) async {
    _context = context;
    if (!_isCreated) {
      _isCreated = true;

      showLoader(true);
      await postCreateState();
      showLoader(false);
    }
  }

  Future<void> postCreateState();

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
