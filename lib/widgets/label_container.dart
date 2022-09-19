import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/text_view.dart';

class PrimaryLabelContainer extends StatefulWidget {
  const PrimaryLabelContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryLabelContainer> createState() => _PrimaryLabelContainerState();
}

class _PrimaryLabelContainerState extends State<PrimaryLabelContainer> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          _isFocused = value;
        });
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 50,
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: Dimensions.fieldIcon,
                  child: SvgPicture.asset(Assets.assetsIconsCalender2),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: _isFocused ? Matrix4.translationValues(0, 0, 0) : Matrix4.translationValues(50, 25, 0),
            color: Palette.scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextView(
              'Starts*',
              textType: TextType.hint,
              color: Palette.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
