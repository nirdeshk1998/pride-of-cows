import 'package:flutter/material.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  @protected
  late BuildContext _context;
  @protected
  dynamic _data;
  @protected
  bool _isLoading = false;
  @protected
  bool _isCreated = false;

  BuildContext get context => _context;
  dynamic get data => _data;
  bool get isLoading => _isLoading;

  void initState(BuildContext ctx, [data]) async {
    _context = ctx;
    _data = data;
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
