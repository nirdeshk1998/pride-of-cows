import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/cart/providers/cart_provider.dart';
import 'package:poc/screens/checkout/checkout_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/counter.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(cartProvider);
    final wProvider = ref.watch(cartProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => rProvider.initState(context),
    );

    return StackedLoader(
      isLoading: wProvider.isLoading,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const PrimaryAppBar(showSearch: false),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            'Your Cart',
                            textType: TextType.header,
                            height: 1,
                          ),
                          const SizedBox.square(dimension: 3),
                          TextView(
                            '(${wProvider.totalItems} items)',
                            height: 1,
                          ),
                        ],
                      ),
                      const SizedBox.square(dimension: 10),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: wProvider.cartList?.length ?? 0,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (_, index) => const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final element = wProvider.cartList?[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5, top: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox.square(
                                        dimension: 100,
                                        child: Image.network(
                                          'https://i.pinimg.com/564x/6f/e5/00/6fe50068243ce3b57b127d8aff26a3e1.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox.square(dimension: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              '${element?.productName}',
                                              textType: TextType.titleStyled,
                                              color: Palette.textColor,
                                              height: 1,
                                            ),
                                            // const SizedBox(width: 5),
                                            // TextView(
                                            //   '(500 grams)',
                                            //   textType: TextType.regular,
                                            //   color: Palette.textColor,
                                            //   height: 1.1,
                                            // ),
                                            const Spacer(),
                                            PrimaryIconButton(
                                              svg: Assets.assetsIconsDelete,
                                              size: 20,
                                              onPressed: () => rProvider.onDeleteButton(element?.itemId),
                                            ),
                                          ],
                                        ),
                                        TextView(
                                          '₹${element?.itemPrice}',
                                          textType: TextType.regular,
                                          color: Palette.lightTextColor,
                                          height: 1.1,
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox.square(
                                              dimension: 16,
                                              child: SvgPicture.asset(
                                                Assets.assetsIconsClock,
                                                color: Palette.lightTextColor,
                                              ),
                                            ),
                                            const SizedBox(width: 3),
                                            const TextView(
                                              'Delivery plan:',
                                              color: Palette.lightTextColor,
                                              height: 1.1,
                                            ),
                                            const SizedBox(width: 5),
                                            TextView(
                                              '${element?.deliveryPlan}',
                                              color: Palette.textColor,
                                              height: 1.1,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox.square(
                                              dimension: 16,
                                              child: SvgPicture.asset(
                                                Assets.assetsIconsCalender2,
                                                color: Palette.lightTextColor,
                                              ),
                                            ),
                                            const SizedBox(width: 3),
                                            const TextView(
                                              "No. of Days:",
                                              color: Palette.lightTextColor,
                                              height: 1.1,
                                            ),
                                            const SizedBox(width: 5),
                                            TextView(
                                              '${element?.noOfDays}',
                                              color: Palette.textColor,
                                              height: 1.1,
                                            ),
                                            // const SizedBox(width: 10),
                                            // PrimaryIconButton(
                                            //   svg: Assets.assetsIconsPencil,
                                            //   size: 16,
                                            //   onPressed: () {},
                                            // ),
                                          ],
                                        ),
                                        // const SizedBox(height: 5),
                                        // Row(
                                        //   mainAxisSize: MainAxisSize.min,
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     SizedBox.square(
                                        //       dimension: 16,
                                        //       child: SvgPicture.asset(
                                        //         Assets.assetsIconsCalender2,
                                        //         color: Palette.lightTextColor,
                                        //       ),
                                        //     ),
                                        //     const SizedBox(width: 3),
                                        //     const TextView(
                                        //       "Start:",
                                        //       color: Palette.lightTextColor,
                                        //       height: 1.1,
                                        //     ),
                                        //     const SizedBox(width: 5),
                                        //     TextView(
                                        //       '${element?.startDate}',
                                        //       color: Palette.textColor,
                                        //       height: 1.1,
                                        //     ),
                                        //     const SizedBox(width: 10),
                                        //     PrimaryIconButton(
                                        //       svg: Assets.assetsIconsPencil,
                                        //       size: 16,
                                        //       onPressed: () {},
                                        //     ),
                                        //   ],
                                        // ),
                                        // const SizedBox(height: 5),
                                        // Row(
                                        //   mainAxisSize: MainAxisSize.min,
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     SizedBox.square(
                                        //       dimension: 16,
                                        //       child: SvgPicture.asset(
                                        //         Assets.assetsIconsCalender2,
                                        //         color: Palette.lightTextColor,
                                        //       ),
                                        //     ),
                                        //     const SizedBox(width: 3),
                                        //     const TextView(
                                        //       "End:",
                                        //       color: Palette.lightTextColor,
                                        //       height: 1.1,
                                        //     ),
                                        //     const SizedBox(width: 5),
                                        //     TextView(
                                        //       '${element?.endDate}',
                                        //       color: Palette.textColor,
                                        //       height: 1.1,
                                        //     ),
                                        //     const SizedBox(width: 10),
                                        //     PrimaryIconButton(
                                        //       svg: Assets.assetsIconsPencil,
                                        //       size: 16,
                                        //       onPressed: () {},
                                        //     ),
                                        //   ],
                                        // ),
                                        const SizedBox.square(dimension: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PrimaryCounter(
                                              initialCount: element?.quantity,
                                              onCounterChanged: (i) {},
                                            ),
                                            Text('₹ ${element?.totalPrice}')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox.square(dimension: 10),
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Palette.backgroundColor,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Palette.backgroundColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      'You Pay:',
                      textType: TextType.header2,
                      color: Palette.textColor,
                    ),
                    TextView(
                      '₹${wProvider.totalPrice ?? 0}',
                      textType: TextType.header2,
                      color: Palette.textColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: 'checkout',
                  isExpanded: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
