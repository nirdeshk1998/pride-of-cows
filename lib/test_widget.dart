import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:widget_size/widget_size.dart';

class RewardProgressBar extends StatefulWidget {
  const RewardProgressBar({Key? key}) : super(key: key);

  @override
  State<RewardProgressBar> createState() => _RewardProgressBarState();
}

class _RewardProgressBarState extends State<RewardProgressBar> {
  double _progressWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        // Progress background
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: WidgetSize(
            onChange: (size) {
              if (mounted) setState(() => _progressWidth = size.width);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              width: double.maxFinite,
              height: 1,
              color: Colors.blue,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
            width: (_progressWidth) / 1.7,
            height: 3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFA0EAFA), Color(0xFFA9BCEF)],
                stops: [0.1, 0.5],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            color: index < 3 ? const Color(0xff193b61) : const Color(0xff658395),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print((_progressWidth * 100) / (_progressWidth / 50));
                          },
                          child: Text(
                            '${10 * (1 + index)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff658395),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: _progressWidth / 1.6,
          child: SizedBox.square(dimension: 16, child: SvgPicture.asset(Assets.assetsIconsCrown)),
        )
      ],
    );
  }
}
