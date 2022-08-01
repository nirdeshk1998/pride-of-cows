import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/order_cancel/oreder_canceling_reasons.dart';
import 'package:poc/screens/order_edit/edit_order_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/checkbox.dart';
import 'package:poc/widgets/text_view.dart';

class OrderCancelScreen extends ConsumerWidget {
  const OrderCancelScreen({Key? key, required this.orderType}) : super(key: key);

  final OrderType orderType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(color: Palette.backgroundColor),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextView(
                      'Select Items to Cancel',
                      textType: TextType.header2,
                      height: 1,
                      color: Palette.textColor,
                    ),
                    Dimensions.defaultPadding.height,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryCheckbox(
                                onChanged: (bool value) {},
                              ),
                              5.0.width,
                              Expanded(
                                child: Column(
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
                                  ],
                                ),
                              ),
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
                    40.0.height,
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Palette.surfaceColor,
                    ),
                    10.0.height,
                    const TextView('Showing 2 returnable items'),
                    Dimensions.defaultPadding.height,
                    Row(
                      children: [
                        const TextView(
                          'Why don\'t I see all of my cart items?',
                          color: Palette.primaryColor,
                        ),
                        10.0.width,
                        SizedBox.square(
                          dimension: 12,
                          child: SvgPicture.asset(
                            Assets.assetsIconsChevronDownThin,
                            fit: BoxFit.contain,
                            color: Palette.primaryColor,
                          ),
                        )
                      ],
                    ),
                    10.0.height,
                  ],
                ),
                Dimensions.defaultPadding.height,
                Center(
                  child: PrimaryButton(
                    title: 'next',
                    onPressed: () => Utils.push(context, OrderCancellingReasonScreen(orderType: orderType)),
                    width: 200,
                  ),
                ),
                Dimensions.defaultPadding.height,
                Center(
                  child: PrimaryButton(
                    title: 'discard changes',
                    onPressed: () {},
                    isFilled: false,
                    width: 200,
                  ),
                ),
                40.0.height,
              ],
            ),
          ),
        ],
      ),
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
