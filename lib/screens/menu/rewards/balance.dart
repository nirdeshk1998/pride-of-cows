import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/menu/rewards/rewards.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class Balance extends ConsumerWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SecondaryAppBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('My Rewards', style: TextStyles.header),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToogleButton(
                            width: 350,
                            height: 50,
                            toggleBackgroundColor: Colors.white,
                            toggleBorderColor: Color(0xffE1EAF4),
                            toggleColor: Color(0xffE3F6FC),
                            leftDescription: "REWARDS",
                            rightDescription: "HISTORY",
                          onLeftToggleActive: () =>Rewards(),
                          onRightToggleActive: () =>Balance(),
                            ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        print(index.toInt());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: index != 9
                                ? BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 0)))
                                : BoxDecoration(),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    TextView(
                                      "25-11-21",
                                      color: Palette.hintColor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.assetsIconsCrown,
                                            height: 30,
                                            width: 30,
                                          ),
                                          TextView(
                                            "50",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          TextView(
                                            "NEW",
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          TextView(
                                            "redeemed",
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextView(
                                      "+100",
                                      size: 18,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(

                    children: [
                      InkWell(
                        child: SvgPicture.asset(Assets.assetsIconsArrowLeft),
                      ),
                      InkWell(child: TextView("1")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(child: TextView("2")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(child: TextView("3")),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: SvgPicture.asset(Assets.assetsIconsArrowRight),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: Color(0xffD2AB68),
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: TextView(
                              "i",
                              color: Color(0xffD2AB68),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        TextView("How it works?",
                            size: 16, decoration: TextDecoration.underline),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

