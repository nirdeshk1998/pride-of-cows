import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/notification/notification_settings.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class Notifications extends ConsumerWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SecondaryAppBar(),
              const SizedBox(
                            height: Dimensions.defaultPadding
                          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    'Notifications',
                    textType: TextType.header,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsSettings()));
                    },
                    child: SvgPicture.asset(Assets.assetsIconsSettings),
                  ),
                ],
              ),
            ),
            ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: 10,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const TextView(
                                    "Order Delivered",
                                    color: Palette.textColor,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Stack(
                                    children: [
                                      SvgPicture.asset(Assets.assetsIconsSemiRounded),
                                      Positioned(top: 1, left: 5, child: SvgPicture.asset(Assets.assetsIconsGreenTick)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  TextView("Now", size: 16, color: Palette.hintColor),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  children: const [
                                    TextView(
                                      "Your Order",
                                      color: Palette.hintColor,
                                      size: 16,
                                    ),
                                    PrimaryTextButton(title: "#115 ", size: 16, showUnderline: true, padding: EdgeInsets.only(top: 2)),
                                    TextView(
                                      " has been delivered.",
                                      color: Palette.hintColor,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
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
