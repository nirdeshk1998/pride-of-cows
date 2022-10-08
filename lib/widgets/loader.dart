import 'package:flutter/material.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';

class PrimaryLoader extends StatelessWidget {
  const PrimaryLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      alignment: Alignment.center,
      color: Palette.disabledColor.withOpacity(0.5),
      child: const Card(
        color: Palette.disabledColor,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPadding),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class StackedLoader extends StatelessWidget {
  const StackedLoader({Key? key, required this.child, required this.isLoading}) : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading) const PrimaryLoader(),
      ],
    );
  }
}
