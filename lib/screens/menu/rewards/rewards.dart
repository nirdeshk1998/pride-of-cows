import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/styles/widget_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

class Rewards extends ConsumerWidget {
  const Rewards({Key? key}) : super(key: key);

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
                        Text('Rewards', style: TextStyles.header),
                      ],
                    ),
                    Text(
                        "Redeem all rewards you have earned by using the redeem code during checkout.",
                        style: TextStyle(fontSize: 18)),
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
                            onLeftToggleActive: () {},
                            onRightToggleActive: () {}),
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Color(0xffEEF9FF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      TextView(
                        "Current Crown Balance:",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.assetsIconsCrown,
                          height: 30,
                          width: 30,
                        ),
                        TextView(
                          "60",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [
                              Color(0xffF6F3FB),
                              Color(0xffEFF3FB),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          )),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    "Use:",
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.assetsIconsCrown,
                                          height: 25,
                                          width: 25,
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
                                      ],
                                    ),
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
                                  TextView(
                                    "CROWN25",
                                    size: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        TextView(
                                          "REDEEM",
                                          size: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Icon(Icons.arrow_forward_outlined)
                                      ],
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
                                  const SizedBox.square(
                                    dimension: 100,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/paneer.png")),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          "50 % discount",
                                          size: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        const Text(
                                          "Claim to win 250g paneer and a 250g curd combo for free",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextView(
                                          "Valid till 20-02-22",
                                          size: 16,
                                          color: Palette.hintColor,
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
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
            child:Column(
              children: [
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Row(
                    children: [

                    ],
                  ),
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
