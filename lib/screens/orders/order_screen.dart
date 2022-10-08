import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/orders/order_details_screen.dart';
import 'package:poc/screens/orders/providers/order_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/no_data_holder.dart';
import 'package:poc/widgets/text_view.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(orderProvider);
    final watch = ref.watch(orderProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context),
    );

    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            Dimensions.defaultPadding.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextView(
                      'Orders',
                      textType: TextType.header,
                      height: 1,
                    ),
                    10.0.height,
                    const SearchFormField(
                      hintText: 'Search by products, order no., date, etc.',
                    ),
                    30.0.height,
                    if (!watch.isLoading && (watch.orderData == null || watch.orderData?.isEmpty == true))
                      const EmptyData()
                    else
                      Expanded(
                        child: ListView.separated(
                          itemCount: watch.orderData?.length ?? 0,
                          shrinkWrap: false,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) => 30.0.height,
                          itemBuilder: (context, index) {
                            final element = watch.orderData?[index];
                            final elementDetails = element?.orderDetails?.first;

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.backgroundColor,
                              ),
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 15,
                                top: 5,
                                bottom: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 34.0,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius: Dimensions.radius5,
                                          color: Colors.white,
                                        ),
                                        child: TextView(
                                          index.isEven ? 'One-time order' : "Subscription",
                                          textType: TextType.regularBold,
                                          color: Palette.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        minSize: 0,
                                        onPressed: () => Utils.push(
                                          context,
                                          OrderDetailsScreen(
                                            orderId: element?.orderId,
                                            orderType: index.isEven ? OrderType.oneTime : OrderType.subscription,
                                            orderStatus: index.isEven ? OrderStatus.processing : OrderStatus.processing,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            TextView(
                                              "VIEW DETAILS",
                                              textType: TextType.regularBold,
                                              size: TextSize.regularSmall,
                                              color: Palette.primaryColor,
                                            ),
                                            5.0.width,
                                            SizedBox.square(
                                              dimension: 10.0,
                                              child: SvgPicture.asset(
                                                Assets.assetsIconsArrowRight2,
                                                color: Palette.primaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.0.height,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        _textTile(
                                          icon: Assets.assetsIconsCalender2,
                                          title: 'Start:',
                                          subtitle: elementDetails?.fromDate,
                                        ),
                                        5.0.height,
                                        _textTile(
                                          icon: Assets.assetsIconsCalender2,
                                          title: 'End:',
                                          subtitle: elementDetails?.toDate,
                                        ),
                                        5.0.height,
                                        _textTile(icon: Assets.assetsIconsClock, title: 'Delivery Plan:', subtitle: 'Daily'),
                                        5.0.height,
                                        _textTile(icon: Assets.assetsIconsWallet, title: 'Total:', subtitle: '₹${element?.totalAmount}'),
                                        5.0.height,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ImageView(
                                            elementDetails?.thumbImgUrl,
                                            height: 55,
                                            width: 55,
                                          ),
                                        ),
                                        10.0.height,
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Palette.surfaceColor,
                                        ),
                                        10.0.height,
                                        Row(
                                          children: [
                                            TextView(
                                              'Order no.:',
                                              textType: TextType.subtitle,
                                              color: Palette.lightTextColor,
                                            ),
                                            5.0.width,
                                            TextView(
                                              element?.pocOrderId,
                                              textType: TextType.subtitle,
                                              color: Palette.textColor,
                                            ),
                                          ],
                                        ),
                                        5.0.height,
                                        Row(
                                          children: [
                                            SizedBox.square(
                                              dimension: 16,
                                              child: SvgPicture.asset(
                                                index.isEven ? Assets.assetsIconsOngoing : Assets.assetsIconsOngoing,
                                                color: index.isEven ? Palette.goldenIconColor : Palette.goldenIconColor,
                                              ),
                                            ),
                                            5.0.width,
                                            TextView(
                                              index.isEven ? 'Ongoing' : 'Ongoing',
                                              textType: TextType.subtitle,
                                              color: index.isEven ? Palette.goldenIconColor : Palette.goldenIconColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    Dimensions.defaultPadding.height,
                    if (watch.orderData != null || watch.orderData?.isNotEmpty == true)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryIconButton(
                            svg: Assets.assetsIconsArrowLeftLong,
                            padding: const EdgeInsets.all(10.0),
                            onPressed: () {},
                          ),
                          PrimaryTextButton(
                            title: '1',
                            size: TextSize.regular,
                            weight: FontWeight.bold,
                            padding: const EdgeInsets.all(10.0),
                            onPressed: () {},
                          ),
                          PrimaryTextButton(
                            title: '2',
                            size: TextSize.regular,
                            color: Palette.lightTextColor,
                            weight: FontWeight.bold,
                            padding: const EdgeInsets.all(10.0),
                            onPressed: () {},
                          ),
                          PrimaryTextButton(
                            title: '3',
                            size: TextSize.regular,
                            color: Palette.lightTextColor,
                            weight: FontWeight.bold,
                            padding: const EdgeInsets.all(10.0),
                            onPressed: () {},
                          ),
                          PrimaryIconButton(
                            svg: Assets.assetsIconsArrowRightLong,
                            padding: const EdgeInsets.all(10.0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    Dimensions.defaultPadding.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _textTile({required String icon, String? title, String? subtitle}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 16.0,
          child: SvgPicture.asset(
            icon,
            color: Palette.lightIconColor,
          ),
        ),
        3.0.width,
        TextView(
          title,
          height: 1.2,
          textType: TextType.hint,
          color: Palette.lightTextColor,
        ),
        5.0.width,
        TextView(
          subtitle,
          height: 1.2,
          textType: TextType.hint,
          color: Palette.textColor,
        ),
      ],
    );
  }
}
