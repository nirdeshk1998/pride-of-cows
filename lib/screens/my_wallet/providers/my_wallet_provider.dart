import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myWalletProvider = ChangeNotifierProvider<MyWalletChangeProvider>((ref) {
  return MyWalletChangeProvider();
});

class MyWalletChangeProvider extends ChangeNotifier {}
