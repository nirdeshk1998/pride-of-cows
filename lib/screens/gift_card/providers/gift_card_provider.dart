import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final giftCardProvider = ChangeNotifierProvider.autoDispose<GiftCardChangeProvider>((ref) {
  return GiftCardChangeProvider();
});

class GiftCardChangeProvider extends ChangeNotifier {
  double _widgetHeight = 0.0;
  double get widgetHight => _widgetHeight;

  int _selectedGiftCard = 0;
  int get selectedGiftCard => _selectedGiftCard;

  void onSizeChange(Size i) {
    _widgetHeight = i.height;
  }

  void onGiftCardChangeFun(int i) {
    _selectedGiftCard = i;
    notifyListeners();
  }
}
