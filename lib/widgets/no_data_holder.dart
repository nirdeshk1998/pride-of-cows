import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/text_view.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.isExpanded = true});
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isExpanded ? 1 : 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.assetsIconsProduct,
            height: 100,
            width: 100,
          ),
          Dimensions.defaultPadding.height,
          TextView('nothing to show'.toUpperCase()),
        ],
      ),
    );
  }
}
