import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/checkout/providers/checkout_provider.dart';
import 'package:poc/screens/feedback/rating_page.dart';
import 'package:poc/screens/offers/offers.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/image_view.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool addressSelect = true;
    final read = ref.read(checkoutProvider);
    final watch = ref.watch(checkoutProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context),
    );

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CartOffersDrawer(),
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              PrimaryIconButton(
                                svg: Assets.assetsIconsChevLeft,
                                onPressed: () => Navigator.pop(context),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //   },
                              //   child: const Icon(
                              //     Icons.arrow_back_ios,
                              //     color: Colors.black54,
                              //     size: 20,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Image(image: AssetImage(Assets.assetsIconsShoppingcart)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Cart Summary", style: TextStyles.header),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "(${watch.totalItems})",
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  read.showAndHideItems();
                                },
                                child: watch.showItems ? const Icon(Icons.keyboard_arrow_up) : const Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: watch.showItems,
                            child: ListView.builder(
                              itemCount: watch.cartItemData?.length ?? 0,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final element = watch.cartItemData?[index];
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox.square(
                                          dimension: 100,
                                          child: ImageView(
                                            '${element?.thumbImg}',
                                          ),
                                        ),
                                        10.0.width,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextView(
                                                element?.productName,
                                                textType: TextStyles.subheader,
                                              ),
                                              Text('\u{20B9}${element?.itemPrice}', style: TextStyles.hint),
                                              Row(
                                                children: [
                                                  const Text("Delivery Plan: ", style: TextStyle(color: Colors.grey)),
                                                  Text("${element?.deliveryPlan}"),
                                                ],
                                              ),
                                              const SizedBox(
                                      
                                                height: 2,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Delivery: ", style: TextStyle(color: Colors.grey)),
                                                  Text('${element?.endDate}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Quantity: ", style: TextStyle(color: Colors.grey)),
                                                  Text("${element?.quantity}"),
                                                  const Spacer(),
                                                  Text("\u{20B9}${element?.totalPrice}"),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextView(
                                "Subtotal",
                                color: Color(0xff2B2B2B),
                                fontWeight: FontWeight.w500,
                                size: 14,
                              ),
                              TextView(
                                '\u{20B9}${watch.checkoutData?.totalPrice}',
                                color: const Color(0xff2B2B2B),
                                fontWeight: FontWeight.w500,
                                size: 14,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Taxes",
                                style: TextStyles.hint,
                              ),
                              Text('\u{20B9}${watch.checkoutData?.totalTaxes}', style: TextStyles.hint),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyles.hint,
                              ),
                              Text('-\u{20B9}${watch.checkoutData?.discountValue}', style: TextStyles.hint),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      color: const Color(0xFFEEF9FF),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Offers", style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 16)),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // rProvider.appliedOffer == ""
                          //     ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Image(image: AssetImage(Assets.assetsIconsDiscount)),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text("Select a promo code"),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      scaffoldKey.currentState!.openEndDrawer();
                                    },
                                    child: const Text(
                                      "VIEW OFFERS",
                                      style: TextStyle(fontSize: 12, color: Color(0xff193B61), fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // : Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Container(
                          //         child: Row(
                          //           children: [
                          //             SvgPicture.asset(Assets.assetsIconsGreenTick),
                          //             const SizedBox(
                          //               width: 5,
                          //             ),
                          //             TextView(
                          //               "${rProvider.appliedOffer} applied!",
                          //               size: 16,
                          //             ),
                          //             const SizedBox(
                          //               width: 5,
                          //             ),
                          //             PrimaryTextButton(
                          //               title: "(Remove)",
                          //               isUpperCase: false,
                          //               showUnderline: true,
                          //               onPressed: () {
                          //                 rProvider.onRemoveOffer();
                          //               },
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       Container(
                          //         child: Row(
                          //           children: const [
                          //             TextView("-\u{20B9}${"350"}"),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0x00fafafa),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: GoogleFonts.suranna().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                '\u{20B9}${watch.totalPrice}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              TextView(
                                "CHOOSE ADDRESS",
                                color: Color(0xff193B61),
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              Text(
                                "PAYMENT",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "My Address Book",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: GoogleFonts.suranna().fontFamily,
                                ),
                              ),
                              const TextView(
                                "  (2 saved)",
                                size: 14,
                              ),
                            ],
                          ),
                          ListView.separated(
                            itemCount: watch.addressBookData?.length ?? 0,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            separatorBuilder: (BuildContext context, int index) => Dimensions.defaultPadding.height,
                            itemBuilder: (BuildContext context, int index) {
                              final element = watch.addressBookData?[index];
                              return Material(
                                color: Palette.backgroundColor,
                                borderRadius: Dimensions.radius10,
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    //
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        10.0.height,
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: watch.selectedAddress == index ? true : false,
                                              groupValue: addressSelect,
                                              onChanged: (value) {
                                                read.onAddressRadioButtonClicked(index);
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: TextView(
                                                element?.selectType?.contains('other') == true
                                                    ? element?.othername?.isEmpty == true
                                                        ? element?.selectType?.capitalize
                                                        : element?.othername
                                                    : element?.selectType?.capitalize ?? 'N/A',
                                                textType: TextType.titleStyled,
                                                height: 1,
                                              ),
                                            ),

                                            // const Spacer(),
                                            // 15.0.width,
                                            // PrimaryIconButton(
                                            //   svg: Assets.assetsIconsDelete,
                                            //   color: Palette.lightIconColor,
                                            //   onPressed: () {
                                            //     Utils.showPrimaryDialog(
                                            //       context,
                                            //       headerTitle: 'Are you sure you want to delete it?',
                                            //       direction: Axis.horizontal,
                                            //       bTitle: 'Delete',
                                            //       onDone: () async {
                                            //         read.onDeleteAddressButton(element?.id).whenComplete(() {
                                            //           ref.refresh(myAddressbookProvider);
                                            //         });
                                            //       },
                                            //     );
                                            //   },
                                            //   size: 20.0,
                                            // ),
                                          ],
                                        ),
                                        5.0.height,
                                        Padding(
                                          padding: const EdgeInsets.only(left: 45, right: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Divider(height: 1),
                                              10.0.height,
                                              TextView(
                                                element?.name ?? 'N/A',
                                                size: TextSize.regularLarge,
                                                height: 1,
                                              ),
                                              5.0.height,
                                              TextView(
                                                '${element?.address} ${element?.locality} ${element?.landmark} - ${element?.pincode}'
                                                '\n'
                                                '${element?.stateName}, ${element?.cityName}',
                                                size: TextSize.regularLarge,
                                                height: 1.5,
                                                maxLines: 3,
                                              ),
                                              10.0.height,
                                              TextView(
                                                'Phone number: ${element?.mobileNo}'
                                                '${element?.alternativeNo == null || element?.alternativeNo == '' ? '' : ', '}'
                                                '${element?.alternativeNo}',
                                                size: TextSize.regularLarge,
                                                maxLines: 2,
                                              ),
                                              10.0.height,
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      onPressed: () {},
                      title: "Request a new address",
                      isRounded: true,
                      width: 20,
                      isFilled: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryTextButton(
                            title: 'Refund Policy',
                            isUpperCase: false,
                            showUnderline: true,
                            size: TextSize.textButton,
                            onPressed: () {},
                          ),
                          PrimaryTextButton(
                            title: 'Privacy Policy',
                            isUpperCase: false,
                            showUnderline: true,
                            size: TextSize.textButton,
                            onPressed: () {},
                          ),
                          PrimaryTextButton(
                            title: 'Terms of service',
                            isUpperCase: false,
                            showUnderline: true,
                            size: TextSize.textButton,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RatingPage()));
              },
              title: "Proceed to Payment",
              isExpanded: true,
              isRounded: false,
            ),
          ],
        ),
      ),
    );
  }
}
