import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/order_edit/edit_order_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class OrderDetailsScreen extends ConsumerWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(color: Palette.backgroundColor),
          10.0.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Palette.scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        child: TextView(
                          'One-time order',
                          textType: TextType.regularBold,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                    10.0.height,
                    TextView(
                      'Order no.: 407-5916350',
                      textType: TextType.header,
                    ),
                    5.0.height,
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      child: Row(
                        children: [
                          TextView(
                            'download invoice'.toUpperCase(),
                            textType: TextType.regularBold,
                            size: TextSize.regularSmall,
                            letterSpacing: 0.6,
                            color: Palette.primaryColor,
                          ),
                          5.0.width,
                          SizedBox.square(
                            dimension: 16.0,
                            child: SvgPicture.asset(
                              Assets.assetsIconsDownload,
                              color: Palette.primaryColor,
                            ),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                    Dimensions.defaultPadding.height,
                    _textTile(icon: Assets.assetsIconsCalender2, title: 'Ordered:', subtitle: '04-11-21'),
                    6.0.height,
                    _textTile(
                      icon: Assets.assetsIconsPin,
                      title: 'Deliver to:',
                      subtitle: 'Home',
                      onPressed: () {},
                    ),
                    6.0.height,
                    Row(
                      children: [
                        SizedBox.square(
                          dimension: 16,
                          child: SvgPicture.asset(Assets.assetsIconsOngoing),
                        ),
                        3.0.width,
                        TextView(
                          'Ongoing',
                          textType: TextType.subtitle,
                          color: Palette.goldenIconColor,
                          height: 1.2,
                        ),
                        const Spacer(),
                        PrimaryTextButton(
                          title: 'View Calender',
                          onPressed: () {},
                          isUpperCase: false,
                          showUnderline: true,
                          height: 1.2,
                          size: TextSize.regularLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Dimensions.defaultPadding.height,
              Container(
                color: Palette.scaffoldBackgroundColor,
                padding: const EdgeInsets.all(Dimensions.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        TextView(
                          'Summary',
                          textType: TextType.header,
                          height: 1,
                          color: Palette.textColor,
                        ),
                        5.0.width,
                        TextView(
                          '(2 items)',
                          textType: TextType.regular,
                          height: 0.5,
                          color: Palette.textColor,
                        ),
                      ],
                    ),
                    10.0.height,
                    ListView.separated(
                      itemCount: 2,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: Dimensions.radius10,
                                    clipBehavior: Clip.antiAlias,
                                    child: SizedBox.square(
                                      dimension: 105,
                                      child: Image.asset(
                                        Assets.assetsImagesMilkProd,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  10.0.width,
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        4.0.height,
                                        Row(
                                          children: [
                                            TextView(
                                              'Curd',
                                              textType: TextType.header,
                                              size: TextSize.title,
                                              height: 1,
                                              color: Palette.textColor,
                                            ),
                                            5.0.width,
                                            TextView(
                                              '(500 grams)',
                                              textType: TextType.regular,
                                              height: 0.5,
                                              color: Palette.textColor,
                                            ),
                                          ],
                                        ),
                                        TextView(
                                          '₹50',
                                          textType: TextType.regular,
                                          height: 1,
                                          color: Palette.lightTextColor,
                                        ),
                                        5.0.height,
                                        _textTile(
                                          icon: Assets.assetsIconsClock,
                                          title: 'Delivery Plan:',
                                          subtitle: 'Daily',
                                          fontSize: TextSize.regular,
                                        ),
                                        5.0.height,
                                        _textTile(
                                          icon: Assets.assetsIconsCalender2,
                                          title: 'Delivery:',
                                          subtitle: '31-12-21',
                                          fontSize: TextSize.regular,
                                        ),
                                        5.0.height,
                                        Row(
                                          children: [
                                            _textTile(
                                              title: 'Quantity:',
                                              subtitle: '1',
                                              fontSize: TextSize.regular,
                                            ),
                                            const Spacer(),
                                            TextView(
                                              '₹50',
                                              textType: TextType.regular,
                                              height: 1.5,
                                              color: Palette.textColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              10.0.height,
                              _textTile(
                                icon: Assets.assetsIconsShippingBox,
                                title: 'Status:',
                                fontSize: TextSize.regular,
                              ),
                              5.0.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextView(
                                    "Order placed",
                                    textType: TextType.regular,
                                    color: Palette.lightTextColor,
                                    height: 1,
                                  ),
                                  5.0.width,
                                  const SizedBox(
                                    height: 1,
                                    width: 5,
                                    child: ColoredBox(color: Palette.lightIconColor),
                                  ),
                                  5.0.width,
                                  SizedBox.square(
                                    dimension: 16,
                                    child: SvgPicture.asset(
                                      Assets.assetsIconsProcessing,
                                      color: Palette.orangeIconColor,
                                    ),
                                  ),
                                  5.0.width,
                                  TextView(
                                    "Processing",
                                    textType: TextType.regular,
                                    color: Palette.orangeIconColor,
                                    height: 1,
                                  ),
                                  5.0.width,
                                  const SizedBox(
                                    height: 1,
                                    width: 5,
                                    child: ColoredBox(color: Palette.lightIconColor),
                                  ),
                                  5.0.width,
                                  TextView(
                                    "Delivered",
                                    textType: TextType.regular,
                                    color: Palette.lightTextColor,
                                    height: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) => const Divider(
                        height: 31,
                        thickness: 1,
                        color: Palette.onPrimaryColor,
                      ),
                    ),
                    30.0.height,
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Palette.surfaceColor,
                    ),
                    10.0.height,
                    _textTile2(title: 'Subtotal', subtitle: '₹ 170'),
                    5.0.height,
                    _textTile2(title: 'Discount', subtitle: '₹25', color: Palette.lightTextColor),
                    5.0.height,
                    _textTile2(title: 'Offers', subtitle: '₹25', color: Palette.lightTextColor),
                    5.0.height,
                    _textTile2(title: 'Taxes', subtitle: '₹50', color: Palette.lightTextColor),
                  ],
                ),
              ),
              10.0.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(
                          'Payment method:',
                          textType: TextType.regular,
                          color: Palette.lightTextColor,
                        ),
                        5.0.height,
                        TextView(
                          'Pre-paid using wallet',
                          textType: TextType.subtitle,
                          color: Palette.textColor,
                        ),
                      ],
                    ),
                    TextView(
                      'Total: ₹170',
                      textType: TextType.header2,
                      color: Palette.textColor,
                      height: 2,
                    ),
                  ],
                ),
              ),
              Dimensions.defaultPadding.height,
              Center(
                child: PrimaryButton(
                  title: 'edit order',
                  onPressed: () => Utils.push(context, const EditOrderScreen()),
                  width: 200,
                ),
              ),
              Dimensions.defaultPadding.height,
              Center(
                child: PrimaryButton(
                  title: 'cancel order',
                  onPressed: () {},
                  colorFill: false,
                  width: 200,
                ),
              ),
              40.0.height,
            ],
          ),
        ],
      ),
    );
  }

  Row _textTile2({required String title, required String subtitle, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          title,
          textType: TextType.regular,
          color: color ?? Palette.textColor,
          height: 1,
        ),
        TextView(
          subtitle,
          textType: TextType.regular,
          color: color ?? Palette.textColor,
          height: 1.1,
        ),
      ],
    );
  }

  Row _textTile({
    final String? icon,
    final double? fontSize,
    required final String title,
    final String? subtitle,
    final VoidCallback? onPressed,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null)
          SizedBox.square(
            dimension: 16.0,
            child: SvgPicture.asset(
              icon,
              color: Palette.lightIconColor,
            ),
          ),
        3.0.width,
        TextView(
          title,
          height: 1.2,
          textType: TextType.hint,
          size: fontSize,
          color: Palette.lightTextColor,
        ),
        5.0.width,
        if (subtitle != null)
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: onPressed,
            child: TextView(
              subtitle,
              height: 1.2,
              textType: TextType.hint,
              size: fontSize,
              color: onPressed != null ? Palette.primaryColor : Palette.textColor,
              decoration: onPressed != null ? TextDecoration.underline : null,
            ),
          ),
      ],
    );
  }
}
