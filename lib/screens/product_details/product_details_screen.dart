import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/product_details/providers/product_details_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/calender_picker.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/text_view.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(productDetailsProvider);
    final wProvider = ref.watch(productDetailsProvider);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(),
          const SizedBox.square(dimension: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  'Milk',
                  color: Palette.textColor,
                  textType: TextType.header,
                  boxHeight: 32,
                ),
                const Spacer(),
                TextView(
                  '1 litre - ₹ 100',
                  color: Palette.textColor,
                  textType: TextType.header2,
                  size: TextSize.title,
                  height: 2.1,
                  boxHeight: TextSize.header,
                ),
              ],
            ),
          ),
          const SizedBox.square(dimension: 10),
          CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              height: 220,
              aspectRatio: 1 / 1,
              viewportFraction: 0.7,
              pageSnapping: true,
            ),
            itemBuilder: (_, index, idx) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  wProvider.imageList[index],
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),
            ),
          ),
          const SizedBox.square(dimension: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Expanded(flex: 3, child: Divider(height: 1, thickness: 1, color: Palette.primaryColor)),
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Palette.primaryColor),
                  height: 5,
                  width: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                ),
                const Expanded(child: Divider(height: 1, thickness: 1, color: Palette.surfaceColor)),
              ],
            ),
          ),
          const SizedBox.square(dimension: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextView(
                  'About the Product',
                  textType: TextType.title,
                ),
                const SizedBox.square(dimension: 4),
                Text.rich(
                  style: TextType.subtitle.copyWith(height: 1.5),
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: 'A glassful of magic, each 1 litre bottle contains nothing but milk which is full of love... ',
                      ),
                      TextSpan(
                        text: 'Read more',
                        style: TextStyle(
                          color: Palette.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox.square(dimension: 16),
                TextView(
                  'Delivery plan:',
                  textType: TextType.subtitle,
                  color: Palette.hintColor,
                ),
                // SizedBox(
                //   height: 250,
                //   child: PrimaryCalendarDatePicker(
                //     label: 'Select start date',
                //     initialCalendarMode: DatePickerMode.day,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime.now(),
                //     lastDate: DateTime(DateTime.now().year + 1),
                //     onDateChanged: (i) {},
                //   ),
                // ),
                const SizedBox.square(dimension: 5),

                Wrap(
                  direction: Axis.horizontal,
                  children: wProvider.deliveryPlans
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: PrimaryOutlineButton(
                            title: e,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (builder) => Column(
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        children: [
                                          Dimensions.defaultPadding.height,

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              TextView(
                                                'Milk',
                                                textType: TextType.subtitle,
                                                color: Palette.textColor,
                                                boxHeight: 20,
                                              ),
                                              const SizedBox.square(dimension: 5),
                                              TextView(
                                                '(1 litre -  ₹100)',
                                                textType: TextType.subtitle,
                                                color: Palette.hintColor,
                                                boxHeight: 20,
                                              ),
                                              const Spacer(),
                                              TextView(
                                                '₹100',
                                                textType: TextType.title,
                                                color: Palette.textColor,
                                                boxHeight: 20,
                                              ),
                                            ],
                                          ),
                                          const SizedBox.square(dimension: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              TextView(
                                                'Delivery Plan:',
                                                textType: TextType.subtitle,
                                                color: Palette.hintColor,
                                              ),
                                              const Spacer(),
                                              TextView(
                                                'Alternate',
                                                textType: TextType.subtitle,
                                                color: Palette.textColor,
                                              ),
                                              const SizedBox.square(dimension: 10),
                                              PrimaryIconButton(
                                                svg: Assets.assetsIconsEditPencil,
                                                size: 22,
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                          const SizedBox.square(dimension: 8),
                                          StatefulBuilder(
                                            builder: (context, setState) => PrimaryCalendarDatePicker(
                                              label: 'Select start date',
                                              onDatePressed: () {
                                                wProvider.onStartDatePressed();
                                                setState(() {});
                                              },
                                              isVisible: wProvider.startDateVisibilty,
                                              initialCalendarMode: DatePickerMode.day,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(DateTime.now().year + 1),
                                              onDateChanged: (i) {},
                                            ),
                                          ),
                                          StatefulBuilder(
                                            builder: (context, setState) => PrimaryCalendarDatePicker(
                                              label: 'Select end date',
                                              onDatePressed: () {
                                                wProvider.onEndDatePressed();
                                                setState(() {});
                                              },
                                              isVisible: wProvider.endDateVisibilty,
                                              initialCalendarMode: DatePickerMode.day,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(DateTime.now().year + 1),
                                              onDateChanged: (i) {},
                                            ),
                                          ),
                                          const SizedBox.square(dimension: 6),
                                          Row(
                                            children: [
                                              TextView(
                                                'Quantity of items/day:',
                                                textType: TextType.subtitle,
                                                color: Palette.hintColor,
                                              ),
                                              const Spacer(),
                                              PrimaryCounterWidget(
                                                onCounterChanged: rProvider.onCounterChanged,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),

                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.center,
                                          //   crossAxisAlignment: CrossAxisAlignment.center,
                                          //   children: [
                                          //     TextView(
                                          //       'Select start date:',
                                          //       textType: TextType.subtitle,
                                          //       color: Palette.hintColor,
                                          //     ),
                                          //     const Spacer(),
                                          //     TextView(
                                          //       'Dec 2021',
                                          //       textType: TextType.subtitle,
                                          //       color: Palette.textColor,
                                          //     ),
                                          //     const SizedBox.square(dimension: 5),
                                          //     PrimaryIconButton(
                                          //       svg: Assets.assetsIconsChevLeft,
                                          //       size: 22,
                                          //       onPressed: () {},
                                          //     ),
                                          //     const SizedBox.square(dimension: 5),
                                          //     PrimaryIconButton(
                                          //       svg: Assets.assetsIconsChevRight,
                                          //       size: 22,
                                          //       onPressed: () {},
                                          //     ),
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 200,
                                          //   child: CalendarCarousel(
                                          //     childAspectRatio: 335 / 183,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: StatefulBuilder(
                                        builder: (context, setState) => Row(
                                          children: [
                                            TextView(
                                              'Total quantity of items:',
                                              textType: TextType.subtitle,
                                              color: Palette.hintColor,
                                            ),
                                            const Spacer(),
                                            TextView(
                                              wProvider.totalCounter.toString(),
                                              textType: TextType.title,
                                              color: Palette.textColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Dimensions.defaultPadding.height,
                                    Center(
                                      child: PrimaryButton(
                                        title: 'next',
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),

                // SizedBox(
                //   height: 300,
                //   child: CalendarCarousel(
                //     childAspectRatio: 335 / 183,
                //     daysTextStyle: TextType.calender,
                //     weekendTextStyle: TextType.calender,
                //     prevDaysTextStyle: TextType.calender.copyWith(
                //       color: Palette.lightIconColor,
                //     ),
                //     nextDaysTextStyle: TextType.calender.copyWith(
                //       color: Palette.lightIconColor,
                //     ),
                //     weekdayTextStyle: TextType.calender.copyWith(
                //       color: Palette.lightTextColor,
                //       fontWeight: FontWeight.normal,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
