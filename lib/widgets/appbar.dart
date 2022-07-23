import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/search/search_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/form_fields.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    Key? key,
    required this.showSearch,
    this.controller,
  }) : super(key: key);

  final bool showSearch;
  final TextEditingController? controller;

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
            SizedBox(
              height: kToolbarHeight,
              child: Row(
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
                    onPressed: () {
                      Utils.push(context, const SearchScreen());
                    },
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsSearch),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsCalendar),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsBellDot),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox.square(dimension: 12),
                ],
              ),
            ),
            Visibility(
              visible: showSearch,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: SearchFormField(
                  hintText: 'Search for products',
                  controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimarySearchAppBar extends StatelessWidget {
  const PrimarySearchAppBar({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

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
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox.square(dimension: 9.5),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    splashRadius: 28,
                    iconSize: 24,
                    color: Palette.primaryColor,
                    icon: SizedBox.square(
                      dimension: 24,
                      child: SvgPicture.asset(
                        Assets.assetsIconsBack,
                        fit: BoxFit.contain,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.5),
                    constraints: const BoxConstraints(),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => controller?.clear(),
                    splashRadius: 28,
                    iconSize: 24,
                    color: Palette.primaryColor,
                    icon: SizedBox.square(
                      dimension: 24,
                      child: SvgPicture.asset(
                        Assets.assetsIconsClose,
                        fit: BoxFit.contain,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.5),
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox.square(dimension: 9.5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: SearchFormField(
                hintText: 'Enter here',
                controller: controller,
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
    this.sOnPressed,
    this.sIcon,
    this.color,
  }) : super(key: key);

  final VoidCallback? sOnPressed;
  final String? sIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: color ?? Palette.scaffoldBackgroundColor),
      child: SizedBox(
        height: kToolbarHeight,
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 9.5),
              IconButton(
                onPressed: () => Navigator.pop(context),
                splashRadius: 28,
                iconSize: 24,
                color: Palette.primaryColor,
                icon: SvgPicture.asset(Assets.assetsIconsBack),
                padding: const EdgeInsets.all(10.5),
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              if (sIcon != null)
                IconButton(
                  onPressed: sOnPressed,
                  splashRadius: 28,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(sIcon ?? ''),
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
