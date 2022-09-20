import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/common_model.dart';
import 'package:poc/utils/utils.dart';

export 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void initState(BuildContext context, [data]) async {
    _context = context;
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

extension ResponseHandling on Future<Response> {
  // Future handleError(BuildContext context, void Function(bool value) showLoader) {
  //   return onError(
  //     (DioError error, stackTrace) async {
  //       showLoader(false);
  //       Utils.showPrimarySnackbar(context, error.message, type: SnackType.debugError);
  //       return null;
  //     },
  //   ).catchError(
  //     (Object e) {
  //       showLoader(false);
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       showLoader(false);
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }

  void responseHandler(
    BuildContext context, {
    required void Function(dynamic response) onSuccess,
    // required void Function(CommonResModel response) onError,
    required void Function(dynamic e, StackTrace? st) onException,
  }) async =>
      await then(
        (i) => onSuccess(i.data),
      ).onError(
        (DioError error, stackTrace) {
          final res = CommonResModel.fromJson(error.response?.data);

          switch (error.response?.statusCode) {
            case 300:
              Utils.showPrimarySnackbar(context, res.message, type: SnackType.error);
              break;
            case 400:
              Utils.showPrimarySnackbar(context, res.message, type: SnackType.error);
              break;
            default:
              Utils.showPrimarySnackbar(context, res.message, type: SnackType.error);
              break;
          }

          Utils.showPrimarySnackbar(context, error.response?.data, type: SnackType.debugError);
          onException(error, stackTrace);
        },
      ).catchError(
        (Object e) {
          Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
          onException(e, null);
        },
        test: (Object e) {
          Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
          onException(e, null);
          return false;
        },
      );
}
