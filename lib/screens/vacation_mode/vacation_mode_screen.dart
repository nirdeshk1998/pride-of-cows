import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/vacation_mode/providers/vacation_mode_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/text_view.dart';

class VacationModeScreen extends ConsumerWidget {
  const VacationModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wProvider = ref.watch(vacationModeProvider);
    final rProvider = ref.read(vacationModeProvider);

    return Scaffold(
      body: Column(
        children: [
          SecondaryAppBar(
            sIcon: Assets.assetsIconsHamburger,
            sOnPressed: () {},
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              children: [
                10.0.height,
                TextView(
                  'Vacation Mode',
                  textType: TextType.header,
                  color: Palette.textColor,
                ),
                TextView(
                  'Set vacation mode to pause your subscriptions and deliveries.',
                  textType: TextType.subtitle,
                  color: Palette.hintColor,
                  height: 1.5,
                  maxLines: 2,
                ),
                30.0.height,
                Row(
                  children: [
                    TextView(
                      'Turn on vacation mode',
                      textType: TextType.subtitle,
                      color: Palette.textColor,
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      activeColor: Palette.successColor,
                      value: wProvider.vacationMode,
                      onChanged: (i) => rProvider.vacationModeFun(i),
                    ),
                  ],
                ),
                // Focus(
                //   onFocusChange: (value) {
                //     print(value);
                //   },
                //   child: Stack(
                //     alignment: Alignment.topLeft,
                //     children: [
                //       Container(
                //         height: 50,
                //         width: double.maxFinite,
                //         margin: const EdgeInsets.only(top: 8),
                //         decoration: BoxDecoration(
                //           border: Border.all(),
                //           borderRadius: BorderRadius.circular(100),
                //         ),
                //         child: Row(
                //           children: [
                //             SizedBox.square(
                //               dimension: Dimensions.fieldIcon,
                //               child: SvgPicture.asset(Assets.assetsIconsCalender2),
                //             )
                //           ],
                //         ),
                //       ),
                //       Container(
                //         color: Palette.lightColor,
                //         padding: const EdgeInsets.symmetric(horizontal: 3.0),
                //         margin: const EdgeInsets.symmetric(horizontal: 15.0),
                //         child: TextView(
                //           'Starts*',
                //           textType: TextType.isLabel,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Dimensions.defaultPadding.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
