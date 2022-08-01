import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/product_details/product_details_screen.dart';
import 'package:poc/screens/search/providers/search_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/dividers.dart';
import 'package:poc/widgets/text_view.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(searchProvider);
    final wProvider = ref.watch(searchProvider);

    Widget searchSuggetions = Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Dimensions.defaultPadding.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: TextView(
              'Recent Searches',
              textType: TextType.subtitle,
              color: Palette.lightTextColor,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => searchListTile(
              onTap: () => rProvider.onRecentSearchPressed(true),
              title: ['Milk', 'Curd', 'Offers'][index],
              icon: Assets.assetsIconsRecent,
            ),
          ),
          const PrimaryDivider(),
          Dimensions.defaultPadding.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: TextView(
              'Recommended Searches',
              textType: TextType.subtitle,
              color: Palette.lightTextColor,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => searchListTile(
              onTap: () => rProvider.onRecentSearchPressed(true),
              title: ['Milk', 'Cheese', 'Ghee', 'Curd'][index],
              icon: Assets.assetsIconsRecent,
            ),
          ),
        ],
      ),
    );

    Widget result = Expanded(
      child: ListView(
        padding: const EdgeInsets.all(Dimensions.defaultPadding),
        physics: const BouncingScrollPhysics(),
        children: [
          TextView(
            '20 search results for “Milk”',
            textType: TextType.subtitle,
            color: Palette.lightTextColor,
          ),
          10.0.height,
          GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 157 / 194,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 200,
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (builder) => const ProductDetailsScreen()),
                              );
                            },
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
    );

    return Scaffold(
      body: Column(
        children: [
          PrimarySearchAppBar(
            controller: TextEditingController(),
            onClearPressed: () => rProvider.onRecentSearchPressed(false),
          ),
          wProvider.isSearchResult ? result : searchSuggetions,
        ],
      ),
    );
  }

  InkWell searchListTile({
    required final VoidCallback onTap,
    required final String title,
    required final String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 18,
              child: SvgPicture.asset(
                icon,
              ),
            ),
            8.0.width,
            TextView(
              title,
              color: Palette.textColor,
              size: TextSize.menuTitle,
            ),
          ],
        ),
      ),
    );
  }
}
