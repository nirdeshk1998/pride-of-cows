import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox.square(dimension: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 38,
                      child: Text('Your Cart', style: TextStyles.header),
                    ),
                    const SizedBox.square(dimension: 3),
                    const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text(
                        "(17 items)",
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox.square(dimension: 10),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemBuilder: (context, index) => ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            padding: EdgeInsets.zero,
                            separatorBuilder: (_, index) => const SizedBox(height: 20),
                            itemBuilder: (context, index) => SizedBox(
                              width: 325,
                              child: Column(
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
                                                'https://i.pinimg.com/564x/6f/e5/00/6fe50068243ce3b57b127d8aff26a3e1.jpg'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox.square(dimension: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const SizedBox.square(dimension: 10),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: const [
                                                Text(
                                                  'Milk x 2',
                                                  style: TextStyle(
                                                    color: Color(0xff2b2b2b),
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  "₹200 ",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xff2b2b2b),
                                                    fontSize: 16,
                                                    fontFamily: "Lato",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox.square(dimension: 5),
                                            const Text(
                                              "2 litres",
                                              style: TextStyle(
                                                color: Color(0xff7f7f7f),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox.square(dimension: 15),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox.square(
                                                  dimension: 16,
                                                  child: SvgPicture.asset(
                                                    Assets.assetsIconsCalendar,
                                                    color: Palette.hintColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 3),
                                                const Text(
                                                  "Ordered on:",
                                                  style: TextStyle(
                                                    color: Palette.hintColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "30-10-21",
                                                  style: TextStyle(
                                                    color: Palette.textColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox.square(dimension: 20),
                                    ],
                                  ),
                                  const SizedBox.square(dimension: 10),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Palette.surfaceColor,
                                    indent: 10,
                                    endIndent: 18,
                                  ),
                                  const SizedBox.square(dimension: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Rate:",
                                          style: TextStyle(
                                            color: Color(0xff7f7f7f),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox.square(dimension: 5),
                                        SvgPicture.asset(Assets.assetsIconsStar),
                                        const SizedBox.square(dimension: 5),
                                        SvgPicture.asset(Assets.assetsIconsStar),
                                        const SizedBox.square(dimension: 5),
                                        SvgPicture.asset(Assets.assetsIconsStar),
                                        const SizedBox.square(dimension: 5),
                                        SvgPicture.asset(Assets.assetsIconsStar),
                                        const SizedBox.square(dimension: 5),
                                        SvgPicture.asset(Assets.assetsIconsStar),
                                        const Spacer(),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          minSize: 0,
                                          child: Row(
                                            children: [
                                              const Text(
                                                "REORDER",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff193b61),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.72,
                                                ),
                                              ),
                                              const SizedBox.square(dimension: 5),
                                              SizedBox.square(
                                                dimension: 18,
                                                child: SvgPicture.asset(Assets.assetsIconsRepeat),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
