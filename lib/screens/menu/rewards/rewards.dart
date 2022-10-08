import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/rewards/providers/rewards_providers.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class Rewards extends ConsumerWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isRewardInfoVisible = true;
    String pageTitle = "Rewards";
    final wProvider = ref.watch(rewardProvider);
    final rProvider = ref.read(rewardProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: wProvider.rewardsTabIsPressed == true
                ? TextView(
                    "Rewards",
                    textType: TextType.header,
                  )
                : TextView(
                    "My Rewards",
                    textType: TextType.header,
                  ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: wProvider.rewardsTabIsPressed == true
                  ? const TextView(
                      "Redeem all the rewards you have earned by using the redeem code during checkout.",
                      maxLines: 2,
                      fontWeight: FontWeight.w400,
                      size: 16,
                    )
                  : Container()),
          15.0.height,
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
                        Tab(text: 'Rewards'.toUpperCase()),
                        Tab(text: 'History'.toUpperCase()),
                      ],
                      onTap: (index) {
                        if (index == 0) {
                          rProvider.onRewardTabPressed();
                        }
                        if (index == 1) {
                          rProvider.onHistoryTabPressed();
                        }
                      },
                    ),
                  ),
                  15.0.height,
                  Expanded(
                    child: TabBarView(
                      children: [
                        _RewardTab(context),
                        _HistoryTab(context),
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
                  const TextSpan(text: LocalString.loyaltySubtitle),
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
              icon: Assets.assetsImagesSignIn,
              text: LocalString.howItWorksLoyalty1,
            ),
            30.0.height,
            _sheetPoints(
              icon: Assets.assetsImagesCrown,
              text: LocalString.howItWorksLoyalty2,
            ),
            30.0.height,
            _sheetPoints(
              icon: Assets.assetsImagesRedeemRewards,
              text: LocalString.howItWorksLoyalty3,
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
                    LocalString.howItWorksBottomReferLine,
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

  Widget _HistoryTab(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        print(index.toInt());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: index != 9
                                ? const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0)))
                                : const BoxDecoration(),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    TextView(
                                      "25-11-21",
                                      color: Palette.hintColor,
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
                                            Assets.assetsIconsCrown,
                                            height: 30,
                                            width: 30,
                                          ),
                                          5.width,
                                          const TextView(
                                            "50",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const TextView(
                                            "NEW",
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const TextView(
                                            "redeemed",
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const TextView(
                                      "+100",
                                      size: 18,
                                      color: Colors.green,
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
                    Row(
                      children: [
                        InkWell(
                          child: SvgPicture.asset(Assets.assetsIconsArrowLeft),
                        ),
                        const InkWell(child: TextView("1")),
                        const SizedBox(
                          width: 15,
                        ),
                        const InkWell(child: TextView("2")),
                        const SizedBox(
                          width: 15,
                        ),
                        const InkWell(child: const TextView("3")),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          child: SvgPicture.asset(Assets.assetsIconsArrowRight),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const Divider(
                      thickness: 1,
                      color: const Color(0xffD9D9D9),
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
                              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
                              border: Border.all(
                                color: const Color(0xffD2AB68),
                                width: 1.0,
                              ),
                            ),
                            child: const Center(
                              child: const TextView(
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

  Widget _RewardTab(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: const Color(0xffEEF9FF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      TextView(
                        "Current Crown Balance:",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.assetsIconsCrown,
                          height: 30,
                          width: 30,
                        ),
                        const TextView(
                          "60",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              gradient: const LinearGradient(
                            colors: [
                              Color(0xffF6F3FB),
                              const Color(0xffEFF3FB),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          )),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextView(
                                    "Use:",
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.assetsIconsCrown,
                                          height: 25,
                                          width: 25,
                                        ),
                                        const TextView(
                                          "50",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 15,
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
                                  const TextView(
                                    "CROWN25",
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: const [
                                        TextView(
                                          "REDEEM",
                                          size: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Icon(Icons.arrow_forward_outlined)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox.square(
                                    dimension: 100,
                                    child: Image(image: AssetImage("assets/images/paneer.png")),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 180,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        TextView(
                                          "50 % discount",
                                          size: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "Claim to win 250g paneer and a 250g curd combo for free",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextView(
                                          "Valid till 20-02-22",
                                          size: 16,
                                          color: Palette.hintColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
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
                            borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
                            border: Border.all(
                              color: const Color(0xffD2AB68),
                              width: 1.0,
                            ),
                          ),
                          child: const Center(
                            child: TextView(
                              "i",
                              color: const Color(0xffD2AB68),
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
      );
}
