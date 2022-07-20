import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/test_widget.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class LoyaltyScreen extends ConsumerWidget {
  const LoyaltyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Column yourCrowns = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextView(
          'Your Crowns:',
          textType: TextType.header2,
          color: Palette.textColor,
        ),
        10.0.height,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: Dimensions.radius20,
            color: Palette.secondarySurfaceColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SizedBox.square(
                      dimension: 40,
                      child: SvgPicture.asset(Assets.assetsIconsCrown),
                    ),
                  ),
                  const SizedBox.square(dimension: 5),
                  Row(
                    children: [
                      Text(
                        "35",
                        style: TextStyle(
                          color: const Color(0xff323232),
                          fontSize: 32,
                          fontFamily: GoogleFonts.suranna().fontFamily,
                          height: 1,
                        ),
                      ),
                      const Text(
                        "/50",
                        style: TextStyle(
                          color: Color(0xff658395),
                          fontSize: 16,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    "+ 15 new crowns earned!",
                    style: TextStyle(
                      color: Color(0xff658395),
                      fontSize: 14,
                      height: 1,
                    ),
                  )
                ],
              ),
              const RewardProgressBar(),
            ],
          ),
        ),
        10.0.height,
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '5 crowns ',
                style: TextStyle(
                  color: Palette.primaryColor,
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: 'left to win the next reward!',
                style: TextStyle(
                  color: const Color(0xFF658395),
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SecondaryAppBar(),
          10.0.height,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextView(
                      'Loyalty',
                      textType: TextType.header,
                      color: Palette.textColor,
                      height: 1,
                    ),
                    10.0.height,
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: LocalString.loyaltySubtitle),
                          TextSpan(
                            text: 'Rewards',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Utils.bottomSheet(context,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [TextView('WORK IN PROGRESS')],
                                    ));
                              },
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
                    yourCrowns,
                    40.0.height,
                    TextView(
                      'Earn More Crowns',
                      textType: TextType.header2,
                      color: Palette.textColor,
                    ),
                  ],
                ),
              ),
              10.0.height,
              SizedBox(
                height: 185,
                child: ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  padding: const EdgeInsets.only(left: Dimensions.defaultPadding),
                  itemBuilder: (context, index) => Container(
                    height: 185,
                    width: 325,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(right: Dimensions.defaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xfff4fbfc), Color(0xffe9f0fa)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                child: Image.network(
                                  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/625203100409379.5f084e5c4430a.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            10.0.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  5.0.height,
                                  TextView(
                                    'Subscribe',
                                    textType: TextType.title,
                                    color: Palette.textColor,
                                  ),
                                  5.0.height,
                                  TextView(
                                    'Win every time you complete a monthly subscription of 20 items.',
                                    maxLines: 4,
                                    height: 1.5,
                                    textType: TextType.regular,
                                    color: Palette.textColor,
                                  ),
                                  5.0.height,
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  "Expires",
                                  textType: TextType.regular,
                                  color: Palette.lightTextColor2,
                                ),
                                5.0.height,
                                TextView(
                                  "30-06-22",
                                  textType: TextType.subtitle,
                                  color: Palette.textColor,
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const StadiumBorder(),
                                minimumSize: const Size(50, 50),
                                maximumSize: const Size(500, 50),
                                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                              ),
                              icon: SizedBox.square(
                                dimension: 25,
                                child: SvgPicture.asset(Assets.assetsIconsCrown),
                              ),
                              label: TextView(
                                '10',
                                textType: TextType.header2,
                                size: TextSize.regularLarge,
                                color: Palette.onPrimaryColor,
                                height: 1.9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
