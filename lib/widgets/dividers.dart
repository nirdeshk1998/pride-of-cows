import 'package:flutter/material.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';

class PrimaryDivider extends StatelessWidget {
  const PrimaryDivider({
    Key? key,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  final double? indent, endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Palette.surfaceColor,
      indent: indent ?? Dimensions.defaultPadding,
      endIndent: endIndent ?? Dimensions.defaultPadding,
    );
  }
}
