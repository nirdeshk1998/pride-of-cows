import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/text_view.dart';

class RewardProgressBar extends StatefulWidget {
  const RewardProgressBar({Key? key, required this.value}) : super(key: key);

  final int value;

  @override
  State<RewardProgressBar> createState() => _RewardProgressBarState();
}

class _RewardProgressBarState extends State<RewardProgressBar> {
  @override
  void initState() {
    super.initState();
  }

  // Size _getProgressSize() {
  //   final RenderBox renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox;

  //   final Size size = renderBox.size; // or _widgetKey.currentContext?.size
  //   debugPrint('Size: ${size.width}, ${size.height}');

  //   return size;

  //   // final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   // debugPrint('Offset: ${offset.dx}, ${offset.dy}');
  //   // debugPrint('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  // }

  int get val => widget.value > 50 ? 50 : widget.value;

  @override
  Widget build(BuildContext context) {
    final double progressWidth = MediaQuery.of(context).size.width - 80;
    final double progressValue = (val * 100) / 50;
    final double progress = ((progressWidth) * progressValue) / 100;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Progress Track
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            // key: _widgetKey,
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 9.0),
            width: double.maxFinite,
            color: const Color(0xFF8AD6FF),
          ),
        ),

        // Progress Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Container(
                width: progress,
                height: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFA0EAFA), Color(0xFFA9BCEF)],
                    stops: [0.1, 0.5],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),

        // Progress Steps
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            6,
            (index) => SizedBox(
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  5.0.height,
                  SizedBox.square(
                    dimension: 9,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFEEF9FF),
                          width: 2,
                        ),
                        color: (index * 10) <= val ? Palette.primaryColor : const Color(0xff8AD6FF),
                      ),
                    ),
                  ),
                  4.0.height,
                  TextView(
                    '${10 * index}',
                    textAlign: TextAlign.center,
                    textType: TextType.regular,
                    size: TextSize.regularSmall,
                    height: 1,
                    color: (index * 10) <= val ? Palette.primaryColor : const Color(0xff658395),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Progress Thumb
        Positioned(
          left: progress,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: SizedBox.square(
              dimension: 15,
              child: SvgPicture.asset(Assets.assetsIconsCrown),
            ),
          ),
        )
      ],
    );
  }
}
