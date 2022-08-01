import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/calender_picker/calender_picker2.dart';
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
                SizedBox(
                  height: 400,
                  child: PrimaryCalendar(
                    childAspectRatio: 1,
                    dayPadding: 0,
                    todayButtonColor: Palette.backgroundColor,
                    todayBorderColor: Palette.primaryColor,
                    isScrollable: false,
                    headerMargin: EdgeInsets.zero,
                    daysTextStyle: TextType.calender,
                    todayTextStyle: TextType.calender,
                    selectedDayTextStyle: TextType.calender,
                    headerTextStyle: TextType.calender,
                    weekdayTextStyle: TextType.calender.copyWith(color: Palette.hintColor, fontWeight: FontWeight.normal),
                    weekendTextStyle: TextType.calender,
                    nextDaysTextStyle: TextType.calender.apply(color: Palette.lightIconColor),
                    prevDaysTextStyle: TextType.calender.apply(color: Palette.lightIconColor),
                    inactiveDaysTextStyle: TextType.calender,
                    inactiveWeekendTextStyle: TextType.calender,
                    markedDateCustomTextStyle: TextType.calender,
                    markedDateMoreCustomTextStyle: TextType.calender,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
