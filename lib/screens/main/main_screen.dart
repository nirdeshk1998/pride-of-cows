import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/home/home_screen.dart';
import 'package:poc/screens/main/providers/main_provider.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/screens/products/products_screen.dart';
import 'package:poc/styles/colors.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wProvider = ref.watch(mainProvider);
    final rProvider = ref.read(mainProvider);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        selectedLabelStyle: const TextStyle(fontSize: 0),
        currentIndex: wProvider.currentIndex,
        onTap: rProvider.onMenuTapped,
        items: [
          navItem(icon: Assets.assetsIconsHome, title: 'Home'),
          navItem(icon: Assets.assetsIconsProducts, title: 'Products'),
          navItem(icon: Assets.assetsIconsCart, title: 'Cart'),
          navItem(icon: Assets.assetsIconsMenu, title: 'Menu'),
        ],
      ),
      body: Column(
        children: [
          // Appbar
          Container(
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
                      DropdownButtonHideUnderline(
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
                                        height: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(654321)',
                                      style: TextStyle(
                                        color: const Color(0xFF658395),
                                        fontFamily: GoogleFonts.lato().fontFamily,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1.5,
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
                    visible: wProvider.currentIndex == 0,
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
          ),
          Expanded(
            child: [
              const HomeScreen(),
              const ProductsScreen(),
              const CartScreen(),
              const MenuScreen(),
            ][wProvider.currentIndex],
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem navItem({required String icon, required String title}) {
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        children: [
          SizedBox.square(dimension: 25, child: SvgPicture.asset(icon)),
          Text(title, style: const TextStyle(color: Color(0xff658395), fontSize: 12)),
        ],
      ),
      activeIcon: Column(
        children: [
          SizedBox.square(dimension: 25, child: SvgPicture.asset(icon)),
          Text(title, style: const TextStyle(color: Palette.primaryColor, fontSize: 12)),
          const SizedBox.square(dimension: 4),
          const CircleAvatar(radius: 2, backgroundColor: Palette.primaryColor),
        ],
      ),
    );
  }
}
