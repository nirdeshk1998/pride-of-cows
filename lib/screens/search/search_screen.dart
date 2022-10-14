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
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key, this.keyword}) : super(key: key);

  final String? keyword;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(searchProvider);
    final watch = ref.watch(searchProvider);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(searchProvider).initState(context, keyword);
    });

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
              onTap: () => read.onSearch(['Milk', 'Curd', 'Offers'][index]),
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
              onTap: () => read.onSearch(['Milk', 'Cheese', 'Ghee', 'Curd'][index]),
              title: ['Milk', 'Cheese', 'Ghee', 'Curd'][index],
              icon: Assets.assetsIconsRecent,
            ),
          ),
        ],
      ),
    );

    Widget result = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.defaultPadding).copyWith(bottom: 0),
            child: TextView(
              '${watch.searchData?.length} search results for "${watch.keyword}"',
              height: 1,
              textType: TextType.subtitle,
              color: Palette.lightTextColor,
            ),
          ),
          10.0.height,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: watch.searchData?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Dimensions.defaultPadding).copyWith(top: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 157 / 194,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                final element = watch.searchData?[index];

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
                        child: ImageView(
                          element?.thumb ?? '',
                          height: double.maxFinite,
                          width: double.maxFinite,
                        ),
                      ),
                      const SizedBox.square(dimension: 10),
                      Text(
                        '${element?.name}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '${element?.minimumQuantity} ${element?.productUnit}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Palette.hintColor,
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox.square(dimension: 10),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          // Figma Flutter Generator 120Widget - TEXT
                          Text(
                            '₹${element?.finalprice}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Palette.textColor,
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹${element?.price}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Palette.surfaceColor,
                              fontSize: 14,
                              height: 1.4,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          // const Spacer(),
                          Material(
                            color: Palette.disabledColor,
                            borderRadius: BorderRadius.circular(5),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => ProductDetailsScreen(
                                      productId: element?.id,
                                    ),
                                  ),
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
          ),
        ],
      ),
    );

    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: Column(
          children: [
            PrimarySearchAppBar(
              controller: TextEditingController(text: watch.keyword),
              onSubmitted: (val) => read.onSearch(val),
              onClearPressed: () => read.onTextClear(),
            ),
            watch.isShowResult ? result : searchSuggetions,
          ],
        ),
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
