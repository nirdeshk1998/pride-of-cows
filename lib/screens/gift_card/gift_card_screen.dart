import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/widgets/appbar.dart';

class GiftCardScreen extends ConsumerWidget {
  const GiftCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          SecondaryAppBar(),
        ],
      ),
    );
  }
}
