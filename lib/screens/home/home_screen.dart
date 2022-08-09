import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/home_provider.dart';
import 'package:poc/screens/calendar/calendar_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/reward_progress.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(homeProvider);
    final wProvider = ref.watch(homeProvider);

    MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const PrimaryAppBar(showSearch: true),
        // This week
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 38,
                    child: Text('This Week', style: TextStyles.header),
                  ),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'view calendar',
                    onPressed: () => Utils.push(context, const CalendarScreen()),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 10),
              SizedBox(
                height: 70,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisExtent: 60,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    bool today = wProvider.currentDate.day.toString() == wProvider.getCurrentWeek()[index];
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 41 / 45,
                          child: Container(
                            decoration: BoxDecoration(
                              color: today ? Palette.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffe1eaf4),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  wProvider.weekNameList[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: today ? Palette.altTextColor : Palette.hintColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox.square(dimension: 2),
                                Text(
                                  wProvider.getCurrentWeek()[index],
                                  style: TextStyle(
                                    color: today ? Palette.altTextColor : Palette.textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.72,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox.square(dimension: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            height: 3,
                            width: 15,
                            child: ColoredBox(
                              color: today ? Palette.primaryColor : Palette.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox.square(dimension: 5),
              const Text(
                "Deliveries scheduled:",
                style: TextStyle(
                  color: Palette.hintColor,
                  fontSize: 14,
                ),
              ),
              const Text(
                "Milk x 2",
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox.square(dimension: 20),
        // Deals and offer
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 38,
                child: Text(
                  "Deals & Offers",
                  style: TextStyles.header,
                ),
              ),
            ),
            const SizedBox.square(dimension: 10),
            CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                height: 170,
                pageSnapping: true,
                aspectRatio: 375 / 170,
                viewportFraction: 0.8,
              ),
              itemBuilder: (_, index, idx) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    wProvider.imageList[index],
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                ),
              ),
            ),
            const SizedBox.square(dimension: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Expanded(flex: 3, child: Divider(height: 1, thickness: 1, color: Palette.primaryColor)),
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Palette.primaryColor),
                    height: 5,
                    width: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                  ),
                  const Expanded(flex: 4, child: Divider(height: 1, thickness: 1, color: Palette.surfaceColor)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox.square(dimension: 40),

        // Shop by category
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 38,
                    child: Text('Shop by Category', style: TextStyles.header),
                  ),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'shop all',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 10),
            AspectRatio(
              aspectRatio: 375 / 120,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                separatorBuilder: (context, index) => const SizedBox.square(dimension: 25),
                itemBuilder: (context, index) => Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(wProvider.imageList[2]),
                    ),
                    const SizedBox.square(dimension: 5),
                    const Text(
                      'Milk',
                      style: TextStyle(
                        color: Palette.textColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        10.0.height,

        // PrimarySlider(
        //   value: 0.4,
        //   divisions: 4,
        //   onChanged: (i) {},
        // ),

        // My Crowns
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('My Crowns', style: TextStyles.header),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'view rewards',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox.square(dimension: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                    const RewardProgressBar(
                      value: 30,
                    ),
                  ],
                ),
              ),
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
          ),
        ),
        40.0.height,

        // Refer and earn
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Refer & Earn', style: TextStyles.header),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'view details',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 10),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/736x/a0/9b/01/a09b012df444b020f2638276d43f505c.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Invite your friends to the Pride of\nCows experience so you all can\nwin ',
                          style: TextStyle(
                            color: const Color(0xFF658395),
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: '5 litres milk!',
                          style: TextStyle(
                            color: Palette.primaryColor,
                            fontFamily: GoogleFonts.suranna().fontFamily,
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      onPressed: () {},
                      height: 46,
                      minWidth: 184,
                      elevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(),
                      color: Palette.primaryColor,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox.square(
                            dimension: 24,
                            child: SvgPicture.asset(
                              Assets.assetsIconsWhatsapp,
                            ),
                          ),
                          const SizedBox.square(dimension: 5),
                          Text(
                            'share'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.altTextColor,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 12,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      onPressed: () {},
                      height: 46,
                      minWidth: 184,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Palette.primaryColor),
                      ),
                      padding: const EdgeInsets.symmetric(),
                      color: Colors.transparent,
                      textColor: Palette.primaryColor,
                      elevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Or share via'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 12,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox.square(dimension: 5),
                          SizedBox.square(
                            dimension: 24,
                            child: SvgPicture.asset(
                              Assets.assetsIconsShare,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox.square(dimension: 40),

        // Top Picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Top Picks', style: TextStyles.header),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'shop all',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox.square(dimension: 10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 157 / 194,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xffe1eaf4),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://i.pinimg.com/564x/d8/3c/fc/d83cfc0043cde21c8735110b13f443fe.jpg',
                            height: double.maxFinite,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox.square(dimension: 10),
                        const Text(
                          'Milk',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(
                          '1 litre',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Palette.hintColor,
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox.square(dimension: 10),
                        Row(
                          children: [
                            // Figma Flutter Generator 120Widget - TEXT
                            const Text(
                              '₹120',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Palette.textColor,
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox.square(dimension: 5),
                            const Text(
                              '₹150',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Palette.surfaceColor,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const Spacer(),
                            Material(
                              color: Palette.disabledColor,
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(),
                                  child: const Icon(
                                    CupertinoIcons.arrow_right,
                                    color: Palette.primaryColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox.square(dimension: 40),

        // Order again
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Order Again', style: TextStyles.header),
                  const Spacer(),
                  PrimaryTextButton(
                    title: 'view all',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox.square(dimension: 10),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (_, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) => SizedBox(
                  width: 325,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox.square(
                                dimension: 100,
                                child: Image.network('https://i.pinimg.com/564x/6f/e5/00/6fe50068243ce3b57b127d8aff26a3e1.jpg'),
                              ),
                            ),
                          ),
                          const SizedBox.square(dimension: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox.square(dimension: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Milk x 2',
                                      style: TextStyle(
                                        color: Color(0xff2b2b2b),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "₹200 ",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff2b2b2b),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox.square(dimension: 5),
                                const Text(
                                  "2 litres",
                                  style: TextStyle(
                                    color: Color(0xff7f7f7f),
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox.square(dimension: 15),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox.square(
                                      dimension: 16,
                                      child: SvgPicture.asset(
                                        Assets.assetsIconsCalendar,
                                        color: Palette.hintColor,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    const Text(
                                      "Ordered on:",
                                      style: TextStyle(
                                        color: Palette.hintColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      "30-10-21",
                                      style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox.square(dimension: 20),
                        ],
                      ),
                      const SizedBox.square(dimension: 10),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Palette.surfaceColor,
                        indent: 10,
                        endIndent: 18,
                      ),
                      const SizedBox.square(dimension: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Rate:",
                              style: TextStyle(
                                color: Color(0xff7f7f7f),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox.square(dimension: 5),
                            SvgPicture.asset(Assets.assetsIconsStar),
                            const SizedBox.square(dimension: 5),
                            SvgPicture.asset(Assets.assetsIconsStar),
                            const SizedBox.square(dimension: 5),
                            SvgPicture.asset(Assets.assetsIconsStar),
                            const SizedBox.square(dimension: 5),
                            SvgPicture.asset(Assets.assetsIconsStar),
                            const SizedBox.square(dimension: 5),
                            SvgPicture.asset(Assets.assetsIconsStar),
                            const Spacer(),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: Row(
                                children: [
                                  const Text(
                                    "REORDER",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff193b61),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.72,
                                    ),
                                  ),
                                  const SizedBox.square(dimension: 5),
                                  SizedBox.square(
                                    dimension: 18,
                                    child: SvgPicture.asset(Assets.assetsIconsRepeat),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox.square(dimension: 40),

        // Why pride of cows
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Why Pride of Cows', style: TextStyles.header),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox.square(dimension: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 335 / 188,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://i.pinimg.com/564x/5c/7d/c8/5c7dc835522d10c7365a23ed63836a1d.jpg',
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      PrimaryIconButton(
                        svg: Assets.assetsIconsPlay,
                        size: 58,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox.square(dimension: 20),
            Row(
              children: [
                const SizedBox.square(dimension: 10),
                SizedBox.square(
                  dimension: 80,
                  child: SvgPicture.asset(
                    Assets.assetsIconsArrowLeft,
                  ),
                ),
                const Spacer(),
                SizedBox.square(
                  dimension: 80,
                  child: Image.asset(
                    Assets.assetsImagesGreenPower,
                  ),
                ),
                const Spacer(),
                SizedBox.square(
                  dimension: 80,
                  child: SvgPicture.asset(
                    Assets.assetsIconsArrowRight,
                  ),
                ),
                const SizedBox.square(dimension: 10),
              ],
            ),
            const SizedBox.square(dimension: 5),
            Text(
              "Most Advanced Dairy Farm",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff2b2b2b),
                fontSize: 20,
                fontFamily: GoogleFonts.suranna().fontFamily,
              ),
            )
          ],
        ),
      ],
    );
  }
}
