import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/calender_view.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/text_view.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const PrimaryAppBar(showSearch: false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                10.0.height,
                TextView(
                  'Calendar',
                  textType: TextType.header,
                ),
                CalendarDateViewer(
                  initialDate: DateTime.now(),
                  deliveredDate: [
                    DateTime(2022, 08, 01),
                    DateTime(2022, 08, 02),
                  ],
                  upcomingDate: [
                    DateTime(2022, 09, 08),
                    DateTime(2022, 09, 31),
                    DateTime(2022, 09, 24),
                  ],
                  vacationDate: [
                    DateTime(2022, 09, 31),
                    DateTime(2022, 09, 24),
                    DateTime(2022, 09, 25),
                    DateTime(2022, 09, 26),
                  ],
                  cancelledDate: [
                    DateTime(2022, 08, 31),
                    DateTime(2022, 08, 13),
                  ],
                  firstDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                  ),
                  lastDate: DateTime(
                    DateTime.now().year + 1,
                    DateTime.now().month,
                  ),
                  onDateChanged: (i) {},
                ),
                10.0.height,
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: Dimensions.maxRadius,
                        color: Palette.deliveredColor,
                      ),
                    ),
                    5.0.width,
                    TextView(
                      'Delivered',
                      textType: TextType.regular,
                      size: TextSize.regularSmall,
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: Dimensions.maxRadius,
                        color: Palette.upcomingColor,
                      ),
                    ),
                    5.0.width,
                    TextView(
                      'Upcoming',
                      textType: TextType.regular,
                      size: TextSize.regularSmall,
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: Dimensions.maxRadius,
                        color: Palette.vacationColor,
                      ),
                    ),
                    5.0.width,
                    TextView(
                      'Vacation',
                      textType: TextType.regular,
                      size: TextSize.regularSmall,
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: Dimensions.maxRadius,
                        color: Palette.cancelledColor,
                      ),
                    ),
                    5.0.width,
                    TextView(
                      'Cancelled',
                      textType: TextType.regular,
                      size: TextSize.regularSmall,
                    ),
                  ],
                ),
                30.0.height,
                Row(
                  children: [
                    TextView(
                      '31 Jan',
                      textType: TextType.header,
                      height: 1,
                    ),
                    5.0.width,
                    TextView(
                      '(Monday)',
                      textType: TextType.subtitle,
                      color: Palette.hintColor,
                    ),
                    const Spacer(),
                    TextView(
                      '3 item(s)',
                      textType: TextType.subtitle,
                    ),
                  ],
                ),
                5.0.height,
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Palette.surfaceColor,
                ),
                10.0.height,
                ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    height: 21,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Image.asset(
                        Assets.assetsImagesMilkProd,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                      10.0.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextView(
                              'Curd',
                              textType: TextType.header2,
                              size: TextSize.title,
                              height: 1,
                            ),
                            5.0.height,
                            Wrap(
                              children: [
                                const TextView(
                                  'Delivery plan:',
                                  color: Palette.hintColor,
                                ),
                                5.0.width,
                                const TextView(
                                  'Alternate',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      PrimaryCounter(
                        onCounterChanged: (i) {},
                      ),
                    ],
                  ),
                ),
                Dimensions.defaultPadding.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
