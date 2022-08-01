import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider.autoDispose<SearchChangeProvider>(
  (ref) => SearchChangeProvider(ref),
);

class SearchChangeProvider extends ChangeNotifier {
  AutoDisposeChangeNotifierProviderRef<SearchChangeProvider> ref;
  SearchChangeProvider(this.ref) : super();

  bool _isSearchResult = false;
  bool get isSearchResult => _isSearchResult;

  void onRecentSearchPressed(bool i) {
    _isSearchResult = i;
    notifyListeners();
  }
}
