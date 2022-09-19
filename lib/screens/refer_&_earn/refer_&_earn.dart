import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class ReferAndEarn extends ConsumerWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: TextView(
              'Refer & Earn',
              textType: TextType.header,
            ),
          ),
          10.0.height,
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: 46,
                    margin: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.selectedTabColor),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      splashBorderRadius: BorderRadius.circular(100),
                      indicator: BoxDecoration(
                        color: Palette.selectedTabColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelStyle: TextType.primaryButton.apply(
                        heightFactor: 1.3,
                        color: Palette.primaryColor,
                      ),
                      tabs: [
                        Tab(text: 'Invite'.toUpperCase()),
                        Tab(text: 'Referrals'.toUpperCase()),
                      ],
                    ),
                  ),
                  15.0.height,
                  Expanded(
                    child: TabBarView(
                      children: [
                        _inviteTab(context),
                        _referralsTab(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget?> _howItWorksBottomSheet(BuildContext context) {
    return Utils.showPrimaryBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
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
            10.0.height,
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: LocalString.referEarnSubtitle),
                  TextSpan(
                    text: 'Rewards',
                    style: TextType.subtitle.apply(
                      color: Palette.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
              style: TextType.subtitle.apply(
                color: Palette.textColor,
                heightFactor: 1.5,
              ),
            ),
            30.0.height,
            _sheetPoints(
              icon: Assets.assetsIconsLoveLetter,
              text: LocalString.howItWorksreferEarn1,
            ),
            30.0.height,
            _sheetPoints(
              icon: Assets.assetsIconsPersonalInformation,
              text: LocalString.howItWorksreferEarn2,
            ),
            30.0.height,
            _sheetPoints(
              icon: Assets.assetsIconsMilk,
              text: LocalString.howItWorksreferEarn3,
            ),
            Dimensions.defaultPadding.height,
            const Divider(
              height: 1,
              thickness: 1,
              color: Palette.surfaceColor,
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
                    LocalString.pocCashRbiGuidelines,
                    color: Palette.hintColor,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            40.0.height,
          ],
        ),
      ),
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

  Column _sheetPoints({
    required final String icon,
    final String? text,
  }) {
    return Column(
      children: [
        Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: Dimensions.radius10,
              color: Palette.onPrimaryColor,
            ),
            child: Image.asset(icon)),
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

  Widget _referralsTab(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Referral List", style: TextType.titleStyled),
                  const TextView(
                    "11 referrals",
                    color: Palette.hintColor,
                    size: 16,
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 11,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        print(index.toInt());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: index != 10 ? const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0))) : const BoxDecoration(),
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
                                        Stack(
                                          children: [SvgPicture.asset(Assets.assetsIconsSemiRounded), Positioned(top: 1, left: 5, child: SvgPicture.asset(Assets.assetsIconsGreenTick))],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const TextView(
                                          "Jane Cooper",
                                          color: Colors.black,
                                          size: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          const TextView(
                                            "REDEEM",
                                            color: Color(0xff193B61),
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SvgPicture.asset(
                                            Assets.assetsIconsArrowRight,
                                            width: 60,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.assetsIconsDoubleTick,
                                          ),
                                          const TextView(
                                            "Invite Accepted",
                                            color: Colors.black,
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const TextView(
                                            "-",
                                            color: Palette.hintColor,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(Assets.assetsIconsCart),
                                          const TextView(
                                            "Purchase Completed",
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 3,
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
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
              Container(
                child: Column(
                  children: [
                    PrimaryButton(
                      title: "View More",
                      isFilled: true,
                      onPressed: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () => _howItWorksBottomSheet(context),
                      child: Row(
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: const Color(0xffD2AB68),
                                width: 1.0,
                              ),
                            ),
                            child: const Center(
                              child: TextView(
                                "i",
                                color: Color(0xffD2AB68),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const TextView("How it works?", size: 16, decoration: TextDecoration.underline),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _inviteTab(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset ("assets/images/milkbottleoffer.png"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(text: "Refer a friend to Pride of Cows and you’ll both get ", style: TextStyle(color: Palette.hintColor, fontSize: 16)),
                  TextSpan(
                      text: "5 litres milk free!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: GoogleFonts.suranna().fontFamily,
                        fontSize: 20,
                      )),
                ]),
              ),
            ),

            // SizedBox(
            //   width: 250,
            //   child: ElevatedButton.icon(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       elevation: 0,
            //       shape: const StadiumBorder(),
            //       minimumSize: const Size(50, 50),
            //       maximumSize: const Size(500, 50),
            //     ),
            //     icon: SizedBox.square(
            //       dimension: 25,
            //       child: Image.asset("assets/images/whatsapp_icon.png"),
            //     ),
            //     label: TextView(
            //       'SHARE VIA WHATSAPP',
            //       textType: TextType.header2,
            //       size: TextSize.regularLarge,
            //       color: Palette.onPrimaryColor,
            //       height: 1.9,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // PrimaryButton(
            //   width: 250,
            //   title: "Or share via",
            //   icon: Assets.assetsIconsShare,
            //   iconSize: 30,
            //   onPressed: () {},
            //   isFilled: false,
            // ),
            Container(
              height: 196,
              width: 375,
              color: const Color(0xffEEF9FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Share your code", style: TextStyle(fontSize: 24, fontFamily: GoogleFonts.suranna().fontFamily)),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(50, 50),
                        maximumSize: const Size(500, 50),
                      ),
                      icon: SizedBox.square(
                        dimension: 25,
                        child: Image.asset("assets/images/whatsapp_icon.png"),
                      ),
                      label: TextView(
                        'SHARE VIA WHATSAPP',
                        textType: TextType.header2,
                        size: TextSize.regularLarge,
                        color: Palette.onPrimaryColor,
                        height: 1.9,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                    width: 250,
                    title: "Or share via",
                    icon: Assets.assetsIconsShare,
                    iconSize: 30,
                    onPressed: () {},
                    isFilled: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => _howItWorksBottomSheet(context),
                    child: Row(
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: const Color(0xffD2AB68),
                              width: 1.0,
                            ),
                          ),
                          child: const Center(
                            child: TextView(
                              "i",
                              color: Color(0xffD2AB68),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const PrimaryTextButton(
                          title: "How it works?",
                          size: 16,
                          isUpperCase: false,
                          showUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
