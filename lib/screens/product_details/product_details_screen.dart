import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/screens/main/providers/main_provider.dart';
import 'package:poc/screens/product_details/providers/product_details_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/calender_picker.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({Key? key, this.productId}) : super(key: key);

  final String? productId;

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productDetailsProvider).initState(context, widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rProvider = ref.read(productDetailsProvider);
    final wProvider = ref.watch(productDetailsProvider);
    return Scaffold(
      body: PrimaryStackedLoader(
        isLoading: wProvider.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            const SizedBox.square(dimension: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Dimensions.defaultPadding.width,
                TextView(
                  wProvider.productDetailsData?.name ?? 'N/A',
                  color: Palette.textColor,
                  textType: TextType.header,
                  boxHeight: TextSize.header,
                ),
                const Spacer(),
                TextView(
                  '${wProvider.productDetailsData?.minimumQuantity} ${wProvider.productDetailsData?.productUnit} - ₹ ${wProvider.productDetailsData?.price}',
                  color: Palette.textColor,
                  textType: TextType.header2,
                  size: TextSize.title,
                  height: 1.8,
                  boxHeight: TextSize.header,
                ),
                Dimensions.defaultPadding.width,
              ],
            ),
            Dimensions.defaultPadding.height,
            CarouselSlider.builder(
              itemCount: 1,
              options: CarouselOptions(
                height: 220,
                aspectRatio: 1 / 1,
                viewportFraction: 0.7,
                pageSnapping: true,
              ),
              itemBuilder: (_, index, idx) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ImageView('${wProvider.productDetailsData?.mainImg}'),
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
                    TextSpan(
                      children: [
                        TextSpan(
                          text: wProvider.productDetailsData?.description?.substring(
                            0,
                            wProvider.minimizeAboutProduct ? null : 160,
                          ),
                        ),
                        TextSpan(
                          text: rProvider.minimizeAboutProduct ? ' ' : '... ',
                        ),
                        TextSpan(
                          text: wProvider.minimizeAboutProduct ? 'Read less' : 'Read more',
                          recognizer: TapGestureRecognizer()..onTap = () => rProvider.onReadMoreButton(),
                          style: const TextStyle(
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
                  // PrimaryCalendarDatePicker(
                  //   label: 'Select end date',
                  //   onMonthPressed: () {},
                  //   isVisible: true,
                  //   initialCalendarMode: DatePickerMode.day,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime.now(),
                  //   lastDate: DateTime(DateTime.now().year + 1),
                  //   onDateChanged: (i) {},
                  // ),

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
                                  builder: (builder) {
                                    int totalItemCount = 1;
                                    bool startDateVisibilty = false;
                                    bool endDateVisibilty = false;

                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Column(
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
                                                  PrimaryCalendarDatePicker(
                                                    label: 'Select start date',
                                                    onMonthPressed: () {
                                                      setState(() {
                                                        startDateVisibilty = !startDateVisibilty;
                                                      });
                                                    },
                                                    onDateTapped: () {
                                                      print('object');
                                                    },
                                                    isVisible: startDateVisibilty,
                                                    initialCalendarMode: DatePickerMode.day,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(DateTime.now().year + 1),
                                                    onDateChanged: (i) {},
                                                  ),
                                                  PrimaryCalendarDatePicker(
                                                    label: 'Select end date',
                                                    onMonthPressed: () {
                                                      setState(() {
                                                        endDateVisibilty = !endDateVisibilty;
                                                      });
                                                    },
                                                    isVisible: endDateVisibilty,
                                                    initialCalendarMode: DatePickerMode.day,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(DateTime.now().year + 1),
                                                    onDateChanged: (i) {},
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
                                                      PrimaryCounter(
                                                        onCounterChanged: (i) {
                                                          setState(() {
                                                            totalItemCount = i;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Row(
                                                children: [
                                                  TextView(
                                                    'Total quantity of items:',
                                                    textType: TextType.subtitle,
                                                    color: Palette.hintColor,
                                                  ),
                                                  const Spacer(),
                                                  TextView(
                                                    totalItemCount.toString(),
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
                                                  ref.read(mainProvider).onMenuTapped(Navigation.cart.index);
                                                  Utils.pushAndRemoveUntil(context, const MainScreen());
                                                },
                                              ),
                                            ),
                                            Dimensions.defaultPadding.height,
                                          ],
                                        );
                                      },
                                    );
                                  },
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
      ),
    );
  }
}
