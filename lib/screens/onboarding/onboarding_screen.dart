import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/assets.dart';
import 'package:poc/providers/onboarding_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(onBoardingProvider);
    final wProvider = ref.watch(onBoardingProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Assets.logoPocLogo,
                height: 60,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox.square(dimension: 60),
            SizedBox(
              height: 380,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: wProvider.pageController,
                pageSnapping: true,
                children: [
                  buildOnBoardingColumn(
                    svg: Assets.imagesOb1,
                    title: 'Shop the Best Dairy\nProducts',
                    subtitle: 'Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                  ),
                  buildOnBoardingColumn(
                    svg: Assets.imagesOb2,
                    title: 'Get Deliveries as per Your\nSchedule',
                    subtitle: 'Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                  ),
                  buildOnBoardingColumn(
                    svg: Assets.imagesOb3,
                    title: 'Quick Delivery',
                    subtitle: 'Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 60),
            PrimaryButton(
              title: 'next',
              onPressed: () => rProvider.onNextButton(context),
            ),
            const SizedBox.square(dimension: 20),
            CupertinoButton(
              onPressed: () => rProvider.onSkipButton(context),
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Text(
                "SKIP NOW",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff193b61),
                  fontSize: 12,
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.72,
                ),
              ),
            ),
            const Spacer(),
            DotsIndicator(
              position: wProvider.selectedDot,
              dotsCount: 3,
              decorator: const DotsDecorator(
                size: Size.square(5),
                activeSize: Size.square(5),
                color: Palette.surfaceColor,
                spacing: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Column buildOnBoardingColumn({required String title, required String subtitle, required String svg}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          svg,
          height: 180,
          fit: BoxFit.fitHeight,
        ),
        const Spacer(),
        Text(title, textAlign: TextAlign.center, style: TextStyles.header),
        const SizedBox.square(dimension: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: const Color(0xff7f7f7f),
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 16,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
        ),
      ],
    );
  }
}
