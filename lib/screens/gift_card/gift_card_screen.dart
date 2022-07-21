import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class GiftCardScreen extends ConsumerWidget {
  const GiftCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextView(
                  'Gift Card',
                  textType: TextType.header,
                ),
                20.0.height,
                SizedBox(
                  height: 195,
                  child: Image.asset(
                    Assets.assetsImagesGiftCard,
                    fit: BoxFit.contain,
                  ),
                ),
                30.0.height,
                TextView(
                  'Select gift card:',
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
                          'e-gift card',
                          'physical gift card',
                          'gift a subscription',
                        ][index],
                        letterSpacing: 1,
                        isFilled: isSelected,
                        onPressed: () {},
                      );
                    },
                  ),
                ),
                10.0.height,
                TextView(
                  LocalString.surpriseWithEcard,
                  color: Palette.textColor,
                  textType: TextType.regular,
                  maxLines: 2,
                ),
                Dimensions.defaultPadding.height,
                TextView(
                  'Select amount:',
                  textType: TextType.subtitle,
                  color: Palette.hintColor,
                ),
                5.0.height,
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 15.0,
                  children: List.generate(
                    5,
                    (index) {
                      bool isSelected = index == 0;

                      return PrimaryOutlineButton(
                        title: [
                          '₹500',
                          '₹1000',
                          '₹2000',
                          '₹2500',
                          '₹5000',
                        ][index],
                        letterSpacing: 1,
                        isFilled: isSelected,
                        onPressed: () {},
                      );
                    },
                  ),
                ),
                30.0.height,
                TextView(
                  'To:',
                  textType: TextType.header2,
                  color: Palette.textColor,
                  size: TextSize.title,
                ),
                5.0.height,
                const PrimaryTextFormField(
                  label: 'Recipient\'s full name*',
                ),
                Dimensions.defaultPadding.height,
                const PhoneNumberFormField(
                  label: 'Recipient\'s phone number*',
                ),
                Dimensions.defaultPadding.height,
                // const PrimaryTextFormField(
                //   label: 'Recipient\'s address line 1*',
                // ),
                // Dimensions.defaultPadding.height,
                // const PrimaryTextFormField(
                //   label: 'Recipient\'s address line 2*',
                // ),
                // Dimensions.defaultPadding.height,
                // const PrimaryTextFormField(
                //   label: 'Recipient\'s address line 3',
                // ),
                // Dimensions.defaultPadding.height,
                const PrimaryTextFormField(
                  label: 'Recipient\'s email ID*',
                ),
                30.0.height,
                TextView(
                  'From:',
                  textType: TextType.header2,
                  color: Palette.textColor,
                  size: TextSize.title,
                ),
                5.0.height,
                const PrimaryTextFormField(
                  label: 'Sender\'s full name*',
                ),
                Dimensions.defaultPadding.height,
                const PhoneNumberFormField(
                  label: 'Sender\' phone number*',
                ),
                Dimensions.defaultPadding.height,
                const PrimaryTextFormField(
                  label: 'Sender\'s email ID*',
                ),
                30.0.height,
                const SecondaryFormField(),
                30.0.height,
                Center(
                  child: const PrimaryButton(
                    title: 'add to cart',
                  ),
                ),
                40.0.height,
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Palette.surfaceColor,
                ),
                5.0.height,
                _menuListTileButton(
                  title: 'How it works',
                  icon: Assets.assetsIconsInfoRound,
                  onPressed: () => _howItWorksbottomSheet(context),
                ),
                Dimensions.defaultPadding.height,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget?> _howItWorksbottomSheet(BuildContext context) {
    return Utils.bottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryIconButton(
                  svg: Assets.assetsIconsClose,
                  onPressed: () => Utils.pop(context),
                ),
              ],
            ),
            _menuListTileButton(
              title: 'How it Works',
              icon: Assets.assetsIconsInfoRound,
              vertical: 0,
              iconSize: 18,
              fontSize: TextSize.subHeader,
              isBold: true,
              isUnderline: false,
              isCenter: true,
              color: Palette.textColor,
            ),
            10.0.height,
            const Divider(
              height: 1,
              thickness: 1,
              color: Palette.surfaceColor,
            ),
            Dimensions.defaultPadding.height,
            _sheetPoints(
              point: '1',
              text: LocalString.howItWorksWallet1,
            ),
            30.0.height,
            _sheetPoints(
              point: '2',
              text: LocalString.howItWorksWallet2,
            ),
            30.0.height,
            _sheetPoints(
              point: '3',
              text: LocalString.howItWorksWallet3,
            ),
            30.0.height,
            const Divider(
              height: 1,
              thickness: 1,
              color: Palette.surfaceColor,
            ),
            30.0.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextView(
                  '\u2022  ',
                  color: Palette.hintColor,
                ),
                Expanded(
                  child: TextView(
                    LocalString.pocCashRbiGuidelines,
                    color: Palette.hintColor,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Dimensions.defaultPadding.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextView(
                  '\u2022  ',
                  color: Palette.hintColor,
                ),
                Expanded(
                  child: TextView(
                    LocalString.pocCashUsage,
                    color: Palette.hintColor,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            30.0.height,
          ],
        ),
      ),
    );
  }

  Column _sheetPoints({
    final String? point,
    final String? text,
  }) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: Dimensions.radius10,
            color: Palette.onPrimaryColor,
          ),
          child: TextView(
            point,
            textType: TextType.header,
            height: 1.9,
          ),
        ),
        5.0.height,
        TextView(
          text,
          maxLines: 6,
          height: 1.5,
          textAlign: TextAlign.center,
          color: Palette.textColor,
          size: TextSize.regularLarge,
        ),
      ],
    );
  }

  CupertinoButton _menuListTileButton({
    required final String title,
    required final String icon,
    final bool? isBold,
    final VoidCallback? onPressed,
    final double? horizontal,
    final double? vertical,
    final double? iconSize,
    final double? fontSize,
    final bool? isUnderline,
    final bool? isCenter,
    final Color? color,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 5,
        horizontal: horizontal ?? 0,
      ),
      minSize: 0,
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: iconSize ?? 18,
            child: SvgPicture.asset(
              icon,
              color: Palette.goldenIconColor,
            ),
          ),
          const SizedBox.square(dimension: 5),
          TextView(
            title,
            textType: TextType.regular,
            size: fontSize,
            color: color ?? Palette.primaryColor,
            decoration: isUnderline == false ? null : TextDecoration.underline,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          ),
          if (isCenter != true) const Spacer(),
        ],
      ),
    );
  }
}
