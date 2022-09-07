import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:poc/screens/offers/provider/offer_provider.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/loader.dart';

import 'package:poc/widgets/text_view.dart';

class CartOffersDrawer extends ConsumerStatefulWidget {
  const CartOffersDrawer({Key? key}) : super(key: key);
  @override
  ConsumerState<CartOffersDrawer> createState() => _CartOffersState();
}

class _CartOffersState extends ConsumerState<CartOffersDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = ref.read(offerProvider);
    final watch = ref.watch(offerProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => ref.read(offerProvider).initState(context),
    );

    return Drawer(
      width: MediaQuery.of(context).size.width / 1.1,
      child: StackedLoader(
        isLoading: read.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Apply Coupan",
                        style: TextStyles.drawerHeader,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.clear),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 305,
                    height: 46,
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: SizedBox(
                          height: 55.5,
                          width: 130,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: const BorderSide(color: Colors.transparent))),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFFF2F2F2))),
                            child: const Text(
                              "APPLY",
                              style: TextStyle(color: Color(0xffA6A6A6)),
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20, bottom: 37),
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
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              color: const Color(0xfff8f6f6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(element?.promocodeName.toString().toUpperCase() ?? 'N/A',
                                          style: TextStyle(color: const Color(0xff193B61), fontSize: 16, fontFamily: GoogleFonts.suranna().fontFamily, letterSpacing: 1)),
                                      InkWell(
                                        onTap: () {
                                          read.applyOffer(element?.promocodeName.toString().toUpperCase() ?? 'N/A', context);
                                        },
                                        child: const TextView(
                                          "APPLY OFFERS",
                                          color: Color(0xff193B61),
                                          size: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox.square(
                                        dimension: 100,
                                        child: Image.network(element?.thumbnailImage ?? ''),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width - 218,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\u{20B9}${element?.promocodeDiscountValue} Discount',
                                              style: TextStyle(fontFamily: GoogleFonts.suranna().fontFamily, fontSize: 20),
                                            ),
                                            TextView(
                                              element?.description,
                                              size: 14,
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextView(
                                    element?.description,
                                    size: 14,
                                    color: Palette.hintColor,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
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
