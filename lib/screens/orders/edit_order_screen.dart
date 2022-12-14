import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/orders/order_status_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/calender_picker.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/text_view.dart';

class EditOrderScreen extends ConsumerWidget {
  const EditOrderScreen({Key? key, required this.orderType}) : super(key: key);

  final OrderType orderType;

  Widget _dateSection(BuildContext context) {
    return orderType == OrderType.oneTime
        ? Column(
            children: [
              _textTile(
                icon: Assets.assetsIconsClock,
                title: 'Delivery Plan:',
                subtitle: 'Daily',
                fontSize: TextSize.regular,
              ),
              5.0.height,
              _buttonTextTile(
                context,
                title: 'Delivery:',
                subtitle: '31-12-21',
                onPressed: () => Utils.showPrimaryDialog(
                  context,
                  headerTitle: 'Edit Order',
                  subheaderTitle: 'Select new delivery date',
                  child: PrimaryCalendarDatePicker(
                    isVisible: true,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2060),
                    onDateChanged: (i) {},
                    label: '',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buttonTextTile(
                context,
                title: 'Delivery Plan:',
                subtitle: 'Daily',
                onPressed: () => Utils.showPrimaryDialog(
                  context,
                  headerTitle: 'Edit Order',
                  subheaderTitle: 'Select new delivery plan',
                  onDone: () async {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextView(
                        'Delivery plan:',
                        textType: TextType.subtitle,
                        color: Palette.hintColor,
                      ),
                      5.0.height,
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 15.0,
                        children: List.generate(
                          3,
                          (index) {
                            bool isSelected = index == 0;

                            return PrimaryOutlineButton(
                              title: [
                                'daily',
                                'alternate',
                                'custom',
                              ][index],
                              letterSpacing: 1,
                              isFilled: isSelected,
                              onPressed: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              5.0.height,
              _buttonTextTile(
                context,
                title: 'Start:',
                subtitle: '30-11-21',
                onPressed: () => Utils.showPrimaryDialog(
                  context,
                  headerTitle: 'Edit Order',
                  subheaderTitle: 'Select new delivery date',
                  onDone: () async {},
                  child: PrimaryCalendarDatePicker(
                    isVisible: true,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2060),
                    onDateChanged: (i) {},
                    label: '',
                    onPressed: () {},
                  ),
                ),
              ),
              5.0.height,
              _buttonTextTile(
                context,
                title: 'End:',
                subtitle: '31-12-21',
                onPressed: () => Utils.showPrimaryDialog(
                  context,
                  headerTitle: 'Edit Order',
                  subheaderTitle: 'Select new delivery date',
                  onDone: () async {},
                  child: PrimaryCalendarDatePicker(
                    isVisible: true,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2060),
                    onDateChanged: (i) {},
                    label: '',
                    onPressed: () {},
                  ),
                ),
              ),
              5.0.height,
              PrimaryTextButton(
                title: 'View Calender',
                onPressed: () {},
                isUpperCase: false,
                showUnderline: true,
                height: 1.2,
                size: TextSize.regularLarge,
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        TextView(
                          'Edit Order',
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
                    TextView(
                      LocalString.editOrderSubtitle,
                      textType: TextType.regular,
                      height: 1,
                      color: Palette.lightTextColor,
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
                                          '???50',
                                          textType: TextType.regular,
                                          height: 1,
                                          color: Palette.lightTextColor,
                                        ),
                                        5.0.height,
                                        _dateSection(context),
                                        10.0.height,
                                        Row(
                                          children: [
                                            PrimaryCounter(onCounterChanged: (i) {}),
                                            const Spacer(),
                                            TextView(
                                              '???50',
                                              height: 1.2,
                                              textType: TextType.regular,
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
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) => const Divider(
                        height: 31,
                        thickness: 1,
                        color: Palette.onPrimaryColor,
                      ),
                    ),
                    15.0.height,
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Palette.surfaceColor,
                    ),
                    10.0.height,
                    _textTile2(title: 'Subtotal', subtitle: '??? 170'),
                    5.0.height,
                    _textTile2(title: 'Discount', subtitle: '???25', color: Palette.lightTextColor),
                    5.0.height,
                    _textTile2(title: 'Offers', subtitle: '???25', color: Palette.lightTextColor),
                    5.0.height,
                    _textTile2(title: 'Taxes', subtitle: '???50', color: Palette.lightTextColor),
                    10.0.height,
                    _textTile2(title: 'No. of days', subtitle: '15'),
                  ],
                ),
              ),
              10.0.height,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                color: Palette.backgroundColor,
                child: Column(
                  children: [
                    Dimensions.defaultPadding.height,
                    Row(
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
                              orderType == OrderType.oneTime ? 'Pre-paid using wallet' : '???1500 billed monthly\nvia wallet',
                              textType: TextType.subtitle,
                              color: Palette.textColor,
                            ),
                          ],
                        ),
                        TextView(
                          'Total: ???170',
                          textType: TextType.header2,
                          color: Palette.textColor,
                          height: 2,
                        ),
                      ],
                    ),
                    Dimensions.defaultPadding.height,
                    Center(
                      child: PrimaryButton(
                        title: 'update order',
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () => Utils.push(
                          context,
                          const OrderStatusScreen(status: EditOrderStatus.updated),
                        ),
                        width: 200,
                      ),
                    ),
                    Dimensions.defaultPadding.height,
                    Center(
                      child: PrimaryButton(
                        title: 'discard changes',
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () => Utils.pop(context),
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
        ],
      ),
    );
  }

  Row _buttonTextTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        _textTile(
          icon: Assets.assetsIconsCalender2,
          title: title,
          subtitle: subtitle,
          fontSize: TextSize.regular,
        ),
        PrimaryIconButton(
          svg: Assets.assetsIconsPencil,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          size: 16,
          onPressed: onPressed,
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
              color: color ?? Palette.lightIconColor,
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
