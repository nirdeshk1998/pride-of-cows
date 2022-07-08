import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/widgets/appbar.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        SecondaryAppBar(
          showSearch: false,
        ),
      ],
    );
  }
}
