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
        elevation: 0,
        backgroundColor: Palette.backgroundColor,
        items: [
          navItem(icon: Assets.assetsIconsHome, title: 'Home'),
          navItem(icon: Assets.assetsIconsProducts, title: 'Products'),
          navItem(icon: Assets.assetsIconsCart, title: 'Cart'),
          navItem(icon: Assets.assetsIconsMenu, title: 'Menu'),
        ],
      ),
      body: [
        const HomeScreen(),
        const ProductsScreen(),
        const CartScreen(),
        const MenuScreen(),
      ][wProvider.currentIndex],
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
