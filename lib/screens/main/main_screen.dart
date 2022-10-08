import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/cart_screen.dart';
import 'package:poc/screens/home/home_screen.dart';
import 'package:poc/screens/menu/menu_screen.dart';
import 'package:poc/screens/products/products_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/widgets/text_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    this.navigate,
  }) : super(key: key);

  final NavigationMenu? navigate;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavigationMenu _currentIndex = NavigationMenu.home;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.navigate ?? NavigationMenu.home;
  }

  void onMenuTapped(int value) => setState(
        () => _currentIndex = NavigationMenu.values[value],
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const TextView('Do you want to exit?'),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Yes'),
                ),
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () => Navigator.pop(context, false),
                  child: const TextView('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: _currentIndex.index,
          onTap: onMenuTapped,
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
          const ProductScreen(),
          const CartScreen(),
          const MenuScreen(),
        ][_currentIndex.index],
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
          Text(title , style: const TextStyle(color: Palette.primaryColor, fontSize: 12)),
          const SizedBox.square(dimension: 4),
          const CircleAvatar(radius: 2, backgroundColor: Palette.primaryColor),
        ],
      ),
    );
  }
}
