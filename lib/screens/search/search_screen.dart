import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
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
    Widget searchSuggetions = ListView(
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
            onTap: () {},
            title: ['Milk', 'Curd', 'Offers'][index],
            icon: Assets.assetsIconsRecent,
          ),
        ),
        const PrimaryDivider(),
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
          itemCount: 4,
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => searchListTile(
            onTap: () {},
            title: ['Milk', 'Cheese', 'Ghee', 'Curd'][index],
            icon: Assets.assetsIconsRecent,
          ),
        ),
      ],
    );

    // Widget result = ;

    return Scaffold(
      body: Column(
        children: [
          PrimarySearchAppBar(
            controller: TextEditingController(),
          ),
          Expanded(
            child: searchSuggetions,
          ),
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
