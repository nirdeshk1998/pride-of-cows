import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    Key? key,
    required this.showSearch,
  }) : super(key: key);

  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(238, 249, 255, 1), Color.fromRGBO(234, 247, 254, 1)],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox.square(dimension: 20),
                SvgPicture.asset(Assets.assetsIconsPin),
                const SizedBox.square(dimension: 3),
                Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: 0,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: SvgPicture.asset(
                          Assets.assetsIconsChevronDown,
                          color: const Color(0xFF9DBACA),
                          height: 6,
                          width: 12,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Mumbai ',
                                  style: TextStyle(
                                    color: Palette.primaryColor,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '(654321)',
                                  style: TextStyle(
                                    color: const Color(0xFF658395),
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      onChanged: (i) {},
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    splashRadius: 24,
                    icon: SvgPicture.asset(Assets.assetsIconsSearch),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints()),
                IconButton(
                    onPressed: () {},
                    splashRadius: 24,
                    icon: SvgPicture.asset(Assets.assetsIconsCalendar),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints()),
                IconButton(
                    onPressed: () {},
                    splashRadius: 24,
                    icon: SvgPicture.asset(Assets.assetsIconsBellDot),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints()),
                const SizedBox.square(dimension: 12),
              ],
            ),
            Visibility(
              visible: showSearch,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 5.0),
                      child: SvgPicture.asset(
                        Assets.assetsIconsSearch,
                        color: Palette.hintColor,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                    hintText: 'Search for products',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryAppBar extends StatelessWidget {
  const SecondaryAppBar({
    Key? key,
    this.showRightButton,
  }) : super(key: key);

  final bool? showRightButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(color: Palette.lightColor),
      child: SizedBox(
        height: 50,
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 9.5),
              IconButton(
                onPressed: () => Navigator.pop(context),
                splashRadius: 24,
                iconSize: 24,
                color: Palette.primaryColor,
                icon: SvgPicture.asset(Assets.assetsIconsBack),
                padding: const EdgeInsets.all(10.5),
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              if (showRightButton != false)
                IconButton(
                  onPressed: () {},
                  splashRadius: 24,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(Assets.assetsIconsShare3),
                  padding: const EdgeInsets.all(10.5),
                  constraints: const BoxConstraints(),
                ),
              const SizedBox.square(dimension: 9.5),
            ],
          ),
        ),
      ),
    );
  }
}
