import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/faq_&_links/order_help.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class FaqAndLinks extends ConsumerWidget {
  const FaqAndLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SecondaryAppBar(),
            10.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: TextView(
                "Faq's & Links",
                textType: TextType.header,
              ),
            ),
            20.0.height,
            menuListSection(title: "FAQ's", children: [
              menuListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHelp()));
                },
                title: "Order and My account",
                icon: Assets.assetsIconsCartRound,
              ),
              menuListTile(
                onTap: () {},
                title: "Refer and Earn",
                icon: Assets.assetsIconsGift,
              ),
              menuListTile(
                onTap: () {},
                title: "Our Products",
                icon: Assets.assetsIconsProduct,
              ),
              menuListTile(
                onTap: () {},
                title: "Wallet",
                icon: Assets.assetsIconsWalletRound,
              ),
              menuListTile(
                onTap: () {},
                title: "Address Change",
                icon: Assets.assetsIconsAddressRound,
              ),
              menuListTile(
                onTap: () {},
                title: "Offers and Promotions",
                icon: Assets.assetsIconsOffer,
              ),
            ]),
            10.0.height,
            menuListSection(title: "Legal", children: [
              menuListTile(onTap: () {}, title: "Shipping and Return Policy", iconLabelWidth: 0, iconHeight: 0, iconWidth: 0),
              menuListTile(onTap: () {}, title: "Terms & Conditions", iconLabelWidth: 0, iconHeight: 0, iconWidth: 0),
              menuListTile(onTap: () {}, title: "Privacy Policy", iconLabelWidth: 0, iconHeight: 0, iconWidth: 0),
            ]),
          ],
        ),
      ),
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
    final String icon = "",
    final double? iconHeight = 35,
    final double? iconWidth = 35,
    final double? iconLabelWidth = 8,
    final double? tileIconWidth = 8,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: Column(
          children: [
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: tileIconWidth,
                      ),
                      Container(
                        child: SvgPicture.asset(
                          icon,
                          height: iconHeight,
                          width: iconWidth,
                        ),
                      ),
                      SizedBox(
                        width: iconLabelWidth,
                      ),
                      TextView(
                        title,
                        color: Palette.textColor,
                        size: TextSize.menuTitle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(Assets.assetsIconsChevRight),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}