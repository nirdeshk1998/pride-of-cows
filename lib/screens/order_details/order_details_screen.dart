import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/calendar/calendar_screen.dart';
import 'package:poc/screens/order_cancel/order_cancel_screen.dart';
import 'package:poc/screens/order_edit/edit_order_screen.dart';
import 'package:poc/screens/order_status/order_status_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class OrderDetailsScreen extends ConsumerWidget {
  const OrderDetailsScreen({Key? key, required this.orderType, required this.orderStatus}) : super(key: key);

  final OrderType orderType;
  final OrderStatus orderStatus;

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
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        child: TextView(
                          orderType == OrderType.oneTime ? 'One-time order' : 'Subscription',
                          textType: TextType.regularBold,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ),
                    10.0.height,
                    TextView(
                      'Order no.: 407-5916350',
                      textType: TextType.header2,
                    ),
                    10.0.height,
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
                    _dateSection,
                    6.0.height,
                    _textTile(
                      icon: Assets.assetsIconsPin,
                      title: 'Deliver to:',
                      subtitle: 'Home',
                      color: Palette.hintColor,
                      onPressed: () {},
                    ),
                    6.0.height,
                    Row(
                      children: [
                        SizedBox.square(
                          dimension: 16,
                          child: SvgPicture.asset(
                            orderStatus == OrderStatus.delivered ? Assets.assetsIconsTickRound : Assets.assetsIconsOngoing,
                            color: orderStatus == OrderStatus.delivered ? Palette.success2Color : Palette.goldenIconColor,
                          ),
                        ),
                        3.0.width,
                        TextView(
                          orderStatus == OrderStatus.delivered ? 'Delivered' : 'Ongoing',
                          textType: TextType.subtitle,
                          color: orderStatus == OrderStatus.delivered ? Palette.success2Color : Palette.goldenIconColor,
                          height: 1.2,
                        ),
                        const Spacer(),
                        PrimaryTextButton(
                          title: 'View Calender',
                          onPressed: () => Utils.push(context, const CalendarScreen()),
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
                          textType: TextType.header2,
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
                                          title: orderType == OrderType.oneTime ? 'Delivery:' : 'Next delivery:',
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
                                        5.0.height,
                                        if (orderType == OrderType.subscription)
                                          _textTile(
                                            title: 'Quantity of items delivered:',
                                            subtitle: '10',
                                            fontSize: TextSize.regular,
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
                                  _orderStatusWidget(
                                    icon: orderStatus == OrderStatus.placed ? Assets.assetsIconsProcessing : null,
                                    title: 'Order placed',
                                    color: orderStatus == OrderStatus.placed ? Palette.orangeIconColor : Palette.lightTextColor,
                                  ),
                                  5.0.width,
                                  const SizedBox(
                                    height: 1,
                                    width: 5,
                                    child: ColoredBox(color: Palette.lightIconColor),
                                  ),
                                  5.0.width,
                                  _orderStatusWidget(
                                    icon: orderStatus == OrderStatus.processing ? Assets.assetsIconsProcessing : null,
                                    title: 'Processing',
                                    color: orderStatus == OrderStatus.processing ? Palette.orangeIconColor : Palette.lightTextColor,
                                  ),
                                  5.0.width,
                                  const SizedBox(
                                    height: 1,
                                    width: 5,
                                    child: ColoredBox(color: Palette.lightIconColor),
                                  ),
                                  5.0.width,
                                  _orderStatusWidget(
                                    icon: orderStatus == OrderStatus.delivered ? Assets.assetsIconsTickRound : null,
                                    title: 'Delivered',
                                    color: orderStatus == OrderStatus.delivered ? Palette.success2Color : Palette.lightTextColor,
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
                    if (orderType == OrderType.subscription) 10.0.height,
                    if (orderType == OrderType.subscription) _textTile2(title: 'No. of days', subtitle: '15'),
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
                          orderType == OrderType.oneTime ? 'Pre-paid using wallet' : '₹1500 billed monthly\nvia wallet',
                          textType: TextType.subtitle,
                          height: 1.1,
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
              _actionButtons(context),
              40.0.height,
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return orderStatus == OrderStatus.delivered
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    TextView(
                      'Rate delivery experience:',
                      textType: TextType.subtitle,
                      color: Palette.hintColor,
                      height: 1.3,
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                        (index) => PrimaryIconButton(
                          svg: Assets.assetsIconsStar,
                          size: 20.0,
                          padding: EdgeInsets.only(right: index < 4 ? 5.0 : 0.0),
                          onPressed: () => Utils.showPrimaryDialog(
                            context,
                            headerTitle: 'Your Pride of Cows Experience',
                            bTitle: 'Submit',
                            onDone: () async {
                              Utils.pushAndRemoveUntil(
                                context,
                                const OrderStatusScreen(status: EditOrderStatus.rated),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TextView(
                                      'Rate delivery experience:',
                                      textType: TextType.subtitle,
                                      color: Palette.textColor,
                                      height: 1,
                                    ),
                                    5.0.height,
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => PrimaryIconButton(
                                          svg: Assets.assetsIconsStar,
                                          size: 20.0,
                                          padding: EdgeInsets.only(right: index < 4 ? 5.0 : 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                30.0.height,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TextView(
                                      'Rate product experience:',
                                      textType: TextType.subtitle,
                                      color: Palette.textColor,
                                      height: 1,
                                    ),
                                    5.0.height,
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => PrimaryIconButton(
                                          svg: Assets.assetsIconsStar,
                                          size: 20.0,
                                          padding: EdgeInsets.only(right: index < 4 ? 5.0 : 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                30.0.height,
                                TextView(
                                  'What went well?',
                                  textType: TextType.subtitle,
                                  color: Palette.textColor,
                                  height: 1,
                                ),
                                5.0.height,
                                Wrap(
                                  spacing: 15.0,
                                  runSpacing: 10.0,
                                  children: List.generate(
                                    4,
                                    (index) => PrimaryButton(
                                      onPressed: () {},
                                      title: ['Packaging', 'Product Quality', 'Delivery associate', 'Other'][index],
                                      isFilled: index == 3,
                                      strokeColor: Palette.outlineColor,
                                      height: 46,
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    ),
                                  ),
                                ),
                                5.0.height,
                                const SecondaryFormField(
                                  hint: 'Type your reason here...',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Dimensions.defaultPadding.height,
                PrimaryTextButton(
                  title: 'Have an issue with order?',
                  onPressed: () {},
                  isUpperCase: false,
                  showUnderline: true,
                  size: TextSize.subHeader,
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                title: 'edit order',
                onPressed: () => Utils.push(context, EditOrderScreen(orderType: orderType)),
                width: 200,
              ),
              Dimensions.defaultPadding.height,
              PrimaryButton(
                title: 'cancel order',
                onPressed: () => Utils.push(context, OrderCancelScreen(orderType: orderType)),
                isFilled: false,
                width: 200,
              ),
            ],
          );
  }

  Row _orderStatusWidget({required Color color, String? icon, required String title}) {
    return Row(
      children: [
        if (icon != null)
          SizedBox.square(
            dimension: 16,
            child: SvgPicture.asset(
              icon,
              color: color,
            ),
          ),
        5.0.width,
        TextView(
          title,
          textType: TextType.regular,
          color: color,
          height: 1,
        ),
      ],
    );
  }

  Widget get _dateSection {
    return orderType == OrderType.oneTime
        ? _textTile(
            icon: Assets.assetsIconsCalender2,
            title: 'Ordered:',
            subtitle: '04-11-21',
            fontSize: TextSize.regularLarge,
            color: Palette.hintColor,
          )
        : Column(
            children: [
              _textTile(
                icon: Assets.assetsIconsCalender2,
                title: 'Start:',
                subtitle: '04-11-21',
                fontSize: TextSize.regularLarge,
                color: Palette.hintColor,
              ),
              6.0.height,
              _textTile(
                icon: Assets.assetsIconsCalender2,
                title: 'End:',
                subtitle: '04-12-21',
                fontSize: TextSize.regularLarge,
                color: Palette.hintColor,
              ),
            ],
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
    final Color? color,
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
          color: color ?? Palette.lightTextColor,
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
