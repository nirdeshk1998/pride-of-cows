import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/order_enums.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class OrderStatusScreen extends ConsumerWidget {
  const OrderStatusScreen({Key? key, required this.status}) : super(key: key);

  final OrderStatus status;

  String get orderStatusHeader {
    switch (status) {
      case OrderStatus.updated:
        return 'Order Updated!';
      case OrderStatus.cancelled:
        return 'Order Cancelled!';
      case OrderStatus.cancellationRequest:
        return 'Cancellation Request Received!';
      default:
        return 'Order Updated!';
    }
  }

  String get orderStatusSubtitle {
    switch (status) {
      case OrderStatus.updated:
        return LocalString.orderUpdatedSubtitle;
      case OrderStatus.cancelled:
        return LocalString.orderCancelledSubtitle;
      case OrderStatus.cancellationRequest:
        return LocalString.orderCancellationRequestSubtitle;
      default:
        return LocalString.orderUpdatedSubtitle;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffeef9ff), Color(0xffd6ebf6)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          children: [
            MediaQuery.of(context).viewPadding.top.height,
            5.0.height,
            SizedBox.square(
              dimension: 28.0,
              child: SvgPicture.asset(Assets.assetsIconsCrown),
            ),
            10.0.height,
            Center(
              child: TextView(
                orderStatusHeader,
                textAlign: TextAlign.center,
                textType: TextType.header,
                height: 1,
                maxLines: 2,
                color: Palette.textColor,
              ),
            ),
            10.0.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Palette.primaryColor.withOpacity(0.3),
            ),
            10.0.height,
            Center(
              child: TextView(
                orderStatusSubtitle,
                textType: TextType.subtitle,
                maxLines: 5,
                height: 1.5,
                color: Palette.textColor,
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding).copyWith(top: 25.0),
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding, vertical: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      15.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => PrimaryIconButton(
                            svg: Assets.assetsIconsStar3,
                            size: 30,
                            padding: EdgeInsets.only(right: index < 4 ? 15.0 : 0),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      10.0.height,
                      TextView(
                        'Please rate your editing experience',
                        textAlign: TextAlign.center,
                        textType: TextType.subtitle,
                        color: Palette.textColor,
                      ),
                      30.0.height,
                      PrimaryButton(
                        title: 'submit review',
                        onPressed: () {},
                        width: 180,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffe7f5fc),
                      width: 5,
                    ),
                    color: Palette.scaffoldBackgroundColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.assetsIconsTick,
                      fit: BoxFit.contain,
                      height: 18,
                      width: 18,
                    ),
                  ),
                )
              ],
            ),
            30.0.height,
            TextView(
              'For any queries or suggestions, connect at',
              textAlign: TextAlign.center,
              textType: TextType.subtitle,
              color: Palette.textColor,
            ),
            Dimensions.defaultPadding.height,
            _textTile(icon: Assets.assetsIconsPhone, text: '022 - 68156815'),
            15.0.height,
            _textTile(icon: Assets.assetsIconsWhatsapp2, text: '+91-9876543210'),
            15.0.height,
            _textTile(icon: Assets.assetsIconsEmail, text: 'bookings@prideofcows.com'),
            30.0.height,
            Center(
              child: PrimaryButton(
                title: 'continue shopping',
                onPressed: () {},
                width: 220,
              ),
            ),
            Dimensions.defaultPadding.height,
            Center(
              child: PrimaryButton(
                title: 'go back to home',
                onPressed: () => Utils.pushAndRemoveUntil(context, const MainScreen()),
                width: 220,
                colorFill: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _textTile({required String icon, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          height: 20,
          width: 20,
        ),
        5.0.width,
        PrimaryTextButton(
          title: text,
          onPressed: () {},
          isUpperCase: false,
          color: Palette.primaryColor,
          size: TextSize.regularLarge,
          showUnderline: true,
        ),
      ],
    );
  }
}
