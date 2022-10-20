import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/product_details/product_details_screen.dart';
import 'package:poc/screens/products/providers/product_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/indicators.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  int? page;
  PaginationViewType? paginationViewType;
  List<Widget> widgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    final read = ref.read(productProvider);
    final watch = ref.watch(productProvider);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      read.initState(context);
    });

    return DefaultTabController(
      length: watch.categoryList?.length ?? 0,
      initialIndex: 0,
      child: StackedLoader(
        isLoading: watch.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryAppBar(showSearch: false),
            const SizedBox.square(dimension: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextView(
                    'Products',
                    textType: TextType.header,
                    height: 1,
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
            SizedBox(
              height: 50,
              child: TabBar(
                onTap: (index) => read.getSelectedProductList(index),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12.5),
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                indicator: CircleTabIndicator(
                    color: Palette.primaryColor, radius: 2.5),
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
                tabs: List.generate(
                  watch.categoryList?.length ?? 0,
                  (index) {
                    return Tab(
                      text: watch.categoryList?[index].catName.toString(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  watch.categoryList?.length ?? 0,
                  (catIndex) {

                      return GridView.builder(
                          controller: watch.scrollController,
                          itemCount:watch.productList!=[]? watch.productList?.length ?? 0:0,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 157 / 194,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 200,
                          ),
                          itemBuilder: (Build, int index) {
                            final element;
                           if(watch.allLoaded){
                              element=watch.productList?[index];
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
                                        element?.thumb,
                                        height: double.maxFinite,
                                        width: double.maxFinite,
                                      ),
                                    ),
                                    const SizedBox.square(dimension: 10),
                                    Text(
                                      element?.name ?? 'N/A',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      element?.productUnit ?? 'N/A',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Palette.hintColor,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox.square(dimension: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Wrap(
                                            spacing: 5,
                                            runSpacing: 2,
                                            children: [
                                              TextView(
                                                '₹${element?.finalprice.toString().split('.').first ?? 'N/A'}',
                                                textAlign: TextAlign.left,
                                                height: 1,
                                                color: Palette.textColor,
                                                textType: const TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextView(
                                                '₹${element?.price?.split('.').first ?? 'N/A'}',
                                                textAlign: TextAlign.left,
                                                color: Palette.lightIconColor,
                                                textType: const TextStyle(
                                                  fontSize: 14,
                                                  decoration:
                                                  TextDecoration.lineThrough,
                                                  decorationThickness: 2,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Material(
                                          color: Palette.disabledColor,
                                          borderRadius: BorderRadius.circular(5),
                                          clipBehavior: Clip.antiAlias,
                                          child: InkWell(
                                            onTap: () => Utils.push(
                                              context,
                                              ProductDetailsScreen(
                                                  productId: element?.id),
                                            ),
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
                           }
                           else{
                             element=null;
                             return Container();
                           }

                          }
                      );


                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
