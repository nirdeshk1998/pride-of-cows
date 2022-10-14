import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/constants/assets.dart';

import 'package:poc/screens/offers/provider/offer_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';

import 'package:poc/widgets/text_view.dart';

class CartOffersDrawer extends ConsumerWidget {
  const CartOffersDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(offerProvider);
    final watch = ref.watch(offerProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context, 'ahsfka'),
    );

    return Drawer(
      width: MediaQuery.of(context).size.width / 1.09,
      child: StackedLoader(
        isLoading: watch.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        "Apply Coupon",
                        textType: TextType.header,
                        height: 1,
                      ),
                      PrimaryIconButton(
                        onPressed: () => Navigator.pop(context),
                        svg: Assets.assetsIconsClose,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      constraints: const BoxConstraints(maxHeight: 46, minHeight: 46),
                      suffixIcon: const PrimaryButton(
                        title: 'apply',
                        onPressed: null,
                      ),
                      labelText: "Enter Promo Code",
                      labelStyle: const TextStyle(color: Color(0xff808080)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Text("Available Offers", style: TextStyles.drawerHeader),
                  ListView.builder(
                      padding: const EdgeInsets.only(),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: watch.offerList?.length ?? 0,
                      itemBuilder: (_, index) {
                        final element = watch.offerList?[index];
                        debugPrint('element: $element');
                        return Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(color: const Color(0xfff8f6f6), borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    element?.promocodeName.toString().toUpperCase() ?? 'N/A',
                                    size: 16,
                                    height: 1,
                                    color: Palette.primaryColor,
                                    textType: TextType.titleStyled,
                                  ),
                                  PrimaryTextButton(
                                    title: 'APPLY OFFERS',
                                    letterSpacing: 1.6,
                                    weight: FontWeight.bold,
                                    onPressed: () {
                                      read.applyOffer(element?.promocodeName.toString().toUpperCase() ?? 'N/A',element?.promocodeId??0,context);
                                    },
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageView(
                                    element?.thumbnailImage,
                                    height: 100,
                                    width: 100,
                                  ),
                                  // SizedBox.square(
                                  //   dimension: 100,
                                  //   child: Image.network(element?.thumbnailImage ?? ''),
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          element?.promocodeName?.toUpperCase() ?? 'N/A',
                                          height: 1.5,
                                          textType: TextType.titleStyled,
                                        ),
                                        TextView(
                                          element?.description,
                                          size: 14,
                                          maxLines: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextView(
                                'Maximum discount up to ₹${element?.maxValue?.split('.').first} '
                                'on orders above ₹${element?.minimumCartValue?.split('.').first ?? 'N/A'}.',
                                size: 14,
                                height: 1,
                                color: Palette.hintColor,
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
