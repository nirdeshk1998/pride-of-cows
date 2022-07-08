import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/indicators.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const PrimaryAppBar(showSearch: false),
        const SizedBox.square(dimension: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 38,
                child: Text('Products', style: TextStyles.header),
              ),
              const SizedBox.square(dimension: 10),
              Row(
                children: [
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(Assets.assetsIconsFilter),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "FILTER",
                          style: TextStyle(
                            color: Color(0xff9b9b9b),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.72,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(Assets.assetsIconsSort),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "SORT",
                          style: TextStyle(
                            color: Color(0xff9b9b9b),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.72,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12.5),
                  padding: const EdgeInsets.symmetric(horizontal: 7.5),
                  indicator: CircleTabIndicator(color: Palette.primaryColor, radius: 2.5),
                  // labelStyle: ,
                  labelColor: Palette.primaryColor,
                  unselectedLabelColor: const Color(0xff658395),
                  indicatorWeight: 0,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                  tabs: const [
                    Tab(text: 'Milk'),
                    Tab(text: 'Cheese'),
                    Tab(text: 'Ghee'),
                    Tab(text: 'Curd'),
                    Tab(text: 'Butter'),
                    Tab(text: 'Combinations'),
                  ],
                ),
              ),
              SizedBox(
                height: 2000,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    6,
                    (index) => GridView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
