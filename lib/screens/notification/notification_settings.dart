import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/contact_us/contact_us.dart';
import 'package:poc/screens/faq_&_links/faq_&_links.dart';
import 'package:poc/screens/gift_card/gift_card_screen.dart';
import 'package:poc/screens/loyalty_program/loyalty_program_screen.dart';
import 'package:poc/screens/address/my_address_book.dart';
import 'package:poc/screens/profile/my_profile.dart';

import 'package:poc/screens/my_wallet/my_wallet_screen.dart';
import 'package:poc/screens/notification/providers/notification_settings_provider.dart';
import 'package:poc/screens/refer_&_earn/refer_&_earn.dart';
import 'package:poc/screens/vacation_mode/vacation_mode_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/dimensions.dart';

class NotificationsSettings extends ConsumerWidget {
  const NotificationsSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wProvider = ref.watch(notificationSettingProvider);
    final rProvider = ref.read(notificationSettingProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              NotificationAppBar(
                sIcon: Assets.assetsIconsSearch,
                sIcon2: Assets.assetsIconsCalendar,
                sicon3: Assets.assetsIconsBellDot,
              ),
              10.0.height,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultPadding),
                child: Row(
                  children: [
                    TextView(
                      'Notification Preferences',
                      textType: TextType.header,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: TextView(
                                  "Push Notification",
                                  color: Palette.textColor,
                                  size: 16,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child:Row(
                              children: [
                                TextView("To enable notifications, go to ",color: Palette.hintColor,size: 16,),
                                PrimaryTextButton(title: "settings",size: 16,showUnderline: true,padding: EdgeInsets.only(top: 2),isUpperCase: false,),
                              ],
                            ),

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextView(
                                  "Enable All",
                                  color: Palette.textColor,
                                  size: 16,
                                ),
                          ),
                          CupertinoSwitch(
                            activeColor: Palette.successColor,
                            value: wProvider.notificationSetting,
                            onChanged: (i) => rProvider.notificationSettingFun(i),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3 ,
                      ),
                      Row(
                        children: [
                          Container(
                            child:Row(
                              children: [
                                TextView("Turn on to receive all notifications.",color: Palette.hintColor,size: 16,),

                              ],
                            ),

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextView(
                                  "Order and Purchases",
                                  color: Palette.textColor,
                                  size: 16,
                                ),
                          ),
                          CupertinoSwitch(
                            activeColor: Palette.successColor,
                            value: wProvider.notificationSetting,
                            onChanged: (i) => rProvider.notificationSettingFun(i),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3 ,
                      ),
                          Container(
                            child:  TextView("Receive updates related to your orders and subscriptions",color: Palette.hintColor,size: 16,maxLines: 2,),



                          ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextView(
                                  "Promos and offers",
                                  color: Palette.textColor,
                                  size: 16,
                                ),
                          ),
                          CupertinoSwitch(
                            activeColor: Palette.successColor,
                            value: wProvider.notificationSetting,
                            onChanged: (i) => rProvider.notificationSettingFun(i),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3 ,
                      ),
                          Container(
                            child:  TextView("Receive notifications for coupons, promotions and offers.",color: Palette.hintColor,size: 16,maxLines: 2,),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CupertinoButton menuListTileButton({
    required final String title,
    required final String icon,
  }) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      minSize: 0,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 18,
            child: SvgPicture.asset(
              icon,
              color: Palette.goldenIconColor,
            ),
          ),
          const SizedBox.square(dimension: 5),
          TextView(
            title,
            color: Palette.primaryColor,
            decoration: TextDecoration.underline,
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  Column menuListSection({
    required final List<Widget> children,
    required final String title,
    final double? bPadding,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextView(
            title,
            color: Palette.lightTextColor,
            height: 1,
          ),
        ),
        const SizedBox.square(dimension: 10),
        Column(
          children: children,
        ),
        const SizedBox.square(dimension: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: Palette.surfaceColor,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox.square(dimension: bPadding ?? 20),
      ],
    );
  }

  InkWell menuListTile({
    required final VoidCallback onTap,
    required final String title,
    required final String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 25,
              child: SvgPicture.asset(
                icon,
              ),
            ),
            const SizedBox.square(dimension: 8),
            TextView(
              title,
              color: Palette.textColor,
              size: TextSize.menuTitle,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _profileTile({
    List<Color>? gradColors,
    required String icon,
    required String text,
    required String title,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradColors ??
                [
                  const Color(0xffffe3ca),
                  const Color(0xfff8b8a4),
                ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 24,
                  child: SvgPicture.asset(icon),
                ),
                const SizedBox.square(dimension: 5),
                TextView(
                  text,
                  color: Palette.textColor,
                  textType: TextType.header2,
                  height: 1.35,
                  boxHeight: 28,
                ),
              ],
            ),
            TextView(
              title,
              color: Palette.hintColor,
            ),
          ],
        ),
      ),
    );
  }
}
