import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/data/models/cart_add_model.dart';
import 'package:poc/screens/product_details/providers/product_details_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/calender_picker.dart';
import 'package:poc/widgets/checkbox.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({Key? key, this.productId}) : super(key: key);

  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(productDetailsProvider);
    final watch = ref.watch(productDetailsProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context, productId),
    );

    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            Dimensions.defaultPadding.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    watch.productDetailsData?.name ?? 'N/A',
                    color: Palette.textColor,
                    textType: TextType.header,
                    height: 1,
                  ),
                  TextView(
                    '${watch.productDetailsData?.minimumQuantity} ${watch.productDetailsData?.productUnit} - ₹ ${watch.productDetailsData?.price}',
                    color: Palette.textColor,
                    textType: TextType.header2,
                    size: TextSize.title,
                    height: 1,
                  ),
                ],
              ),
            ),
            Dimensions.defaultPadding.height,
            // if (watch.productDetailsData?.gallery?.isEmpty == true)
            //   Center(
            //     child: ImageView(
            //       Assets.assetsImagesSplashBg,
            //       height: 220,
            //       width: MediaQuery.of(context).size.width / 1.5,
            //     ),
            //   )
            // else
            CarouselSlider.builder(
              itemCount: watch.productDetailsData?.gallery?.length ?? 1,
              options: CarouselOptions(
                height: 220,
                aspectRatio: 1 / 1,
                viewportFraction: 0.7,
                pageSnapping: true,
              ),
              itemBuilder: (_, index, idx) {
                final image = watch.productDetailsData?.gallery?.isNotEmpty == true ? (watch.productDetailsData?.gallery?[index].imagePath) : Assets.assetsImagesSplashBg;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageView(image),
                );
              },
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
                    TextSpan(
                      children: [
                        TextSpan(
                          text: watch.productDetailsData?.description?.substring(
                            0,
                            watch.foldProductDes
                                ? null
                                : (watch.productDetailsData?.description?.length ?? 0) > 160
                                    ? 160
                                    : null,
                          ),
                        ),
                        if ((watch.productDetailsData?.description?.length ?? 0) > 160)
                          TextSpan(
                            text: read.foldProductDes ? ' ' : '... ',
                          ),
                        if ((watch.productDetailsData?.description?.length ?? 0) > 160)
                          TextSpan(
                            text: watch.foldProductDes ? 'Read less' : 'Read more',
                            recognizer: TapGestureRecognizer()..onTap = () => read.onReadMoreButton(),
                            style: const TextStyle(
                              color: Palette.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                      ],
                    ),
                  ),
                  20.0.height,

                  TextView(
                    'Delivery plan:',
                    textType: TextType.subtitle,
                    color: Palette.hintColor,
                  ),
                  5.0.height,

                  Wrap(
                    direction: Axis.horizontal,
                    children: DeliveryPlan.values.map(
                      (dPlan) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: PrimaryOutlineButton(
                            title: dPlan.name,
                            onPressed: () {
                              showModalBottomSheet<Widget>(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (builder) {
                                  int quantity = 1;
                                  String? startDate, endDate, deliverOnDate;
                                  bool endDateVisibilty = false;
                                  bool startDateVisibilty = false;
                                  bool deliverOnVisibilty = false;
                                  List<bool> isSelectedDay = List.filled(7, false, growable: false);

                                  return FractionallySizedBox(
                                    heightFactor: 0.6,
                                    child: Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: ListView(
                                                  physics: const BouncingScrollPhysics(),
                                                  shrinkWrap: true,
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
                                                          dPlan.name.capitalize,
                                                          textType: TextType.subtitle,
                                                          color: Palette.textColor,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox.square(dimension: 10),

                                                    // True when delivery plan is not once
                                                    if (dPlan != DeliveryPlan.once)
                                                      PrimaryCalendarDatePicker(
                                                        label: 'Select start date',
                                                        title: startDate,
                                                        isVisible: startDateVisibilty,
                                                        initialCalendarMode: DatePickerMode.day,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(DateTime.now().year + 1),
                                                        onPressed: () => setState(() {
                                                          startDateVisibilty = !startDateVisibilty;
                                                          endDateVisibilty = false;
                                                        }),
                                                        onDateChanged: (i) => setState(() {
                                                          startDate = Utils.dateFormatDMY(i);
                                                          startDateVisibilty = false;
                                                        }),
                                                      )
                                                    else // True when delivery plan is once
                                                      PrimaryCalendarDatePicker(
                                                        label: 'Deliver on:',
                                                        title: deliverOnDate,
                                                        isVisible: deliverOnVisibilty,
                                                        initialCalendarMode: DatePickerMode.day,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(DateTime.now().year + 1),
                                                        onPressed: () => setState(() {
                                                          deliverOnVisibilty = !deliverOnVisibilty;
                                                        }),
                                                        onDateChanged: (i) => setState(() {
                                                          deliverOnDate = Utils.dateFormatDMY(i);
                                                          deliverOnVisibilty = false;
                                                        }),
                                                      ),
                                                    if (dPlan != DeliveryPlan.once)
                                                      PrimaryCalendarDatePicker(
                                                        label: 'Select end date',
                                                        title: endDate,
                                                        isVisible: endDateVisibilty,
                                                        initialCalendarMode: DatePickerMode.day,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(DateTime.now().year + 1),
                                                        onPressed: () => setState(() {
                                                          endDateVisibilty = !endDateVisibilty;
                                                          startDateVisibilty = false;
                                                        }),
                                                        onDateChanged: (i) => setState(() {
                                                          endDate = Utils.dateFormatDMY(i);
                                                          endDateVisibilty = false;
                                                        }),
                                                      ),
                                                    5.0.height,
                                                    // True when delivery plan is custom
                                                    if (dPlan == DeliveryPlan.custom)
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          5.0.height,
                                                          TextView(
                                                            'Select days:',
                                                            textType: TextType.subtitle,
                                                            color: Palette.hintColor,
                                                          ),
                                                          5.0.height,
                                                          ListView.separated(
                                                            shrinkWrap: true,
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            itemCount: watch.customDayList.length,
                                                            separatorBuilder: (context, index) => const Divider(height: 5),
                                                            itemBuilder: (context, index) {
                                                              final cDayList = watch.customDayList[index];
                                                              return Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Expanded(
                                                                    child: CupertinoButton(
                                                                      onPressed: () => setState(
                                                                        () => isSelectedDay[index] = !isSelectedDay[index],
                                                                      ),
                                                                      minSize: 0,
                                                                      padding: EdgeInsets.zero,
                                                                      child: Row(
                                                                        children: [
                                                                          PrimaryCheckbox(
                                                                            value: isSelectedDay[index],
                                                                            onChanged: (i) => setState(
                                                                              () => isSelectedDay[index] = i,
                                                                            ),
                                                                          ),
                                                                          10.0.width,
                                                                          TextView(
                                                                            cDayList,
                                                                            textType: TextType.titleStyled,
                                                                            height: 2.2,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  PrimaryCounter(
                                                                    isDisabled: !isSelectedDay[index],
                                                                    initialCount: 0,
                                                                    onCounterChanged: (i) {
                                                                      final cDays = CustomDays(
                                                                        empty: 0,
                                                                        mon: index == 1 ? i : 0,
                                                                        tue: index == 2 ? i : 0,
                                                                        wed: index == 3 ? i : 0,
                                                                        thur: index == 4 ? i : 0,
                                                                        fri: index == 5 ? i : 0,
                                                                        sat: index == 6 ? i : 0,
                                                                        sun: index == 7 ? i : 0,
                                                                      );
                                                                      read.cDays = cDays;
                                                                      setState(
                                                                        () => quantity = i,
                                                                      );
                                                                    },
                                                                  )
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    else // True when delivery plan is not custom
                                                      Row(
                                                        children: [
                                                          TextView(
                                                            'Quantity of items/day:',
                                                            textType: TextType.subtitle,
                                                            color: Palette.hintColor,
                                                          ),
                                                          const Spacer(),
                                                          PrimaryCounter(
                                                            // padding: const EdgeInsets.all(8),
                                                            onCounterChanged: (i) => setState(() => quantity = i),
                                                          ),
                                                        ],
                                                      ),
                                                    const SizedBox(height: 20),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 10),
                                                child: Row(
                                                  children: [
                                                    TextView(
                                                      'Note: Minimum quantity of total items:',
                                                      textType: TextType.subtitle,
                                                      color: Palette.hintColor,
                                                    ),
                                                    const Spacer(),
                                                    TextView(
                                                      watch.productDetailsData?.minimumQuantity.toString(),
                                                      textType: TextType.title,
                                                      color: Palette.textColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Dimensions.defaultPadding.height,
                                              Center(
                                                child: PrimaryButton(
                                                  title: 'add to cart',
                                                  onPressed: () async {
                                                    read.onAddCartButton(
                                                      deliveryPlan: dPlan,
                                                      deliverOnDate: deliverOnDate,
                                                      startDate: startDate,
                                                      endDate: endDate,
                                                      quantity: quantity,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Dimensions.defaultPadding.height,
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ).toList(),
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
      ),
    );
  }
}
