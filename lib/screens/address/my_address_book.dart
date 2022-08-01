import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/providers/login_provider.dart';
import 'package:poc/screens/address/address_information.dart';
import 'package:poc/screens/address/edit_address.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class MyAddressBook extends ConsumerWidget {
  const MyAddressBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rProvider = ref.read(loginProvider);
    final wProvider = ref.watch(loginProvider);
    bool addressSelect = true;

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
                      Text('My Address Book', style: TextStyles.header),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.add, color: Color(0xff193b61)),
                      PrimaryTextButton(
                        title: 'Add a new address',
                        isUpperCase: true,
                        size: TextSize.textButton,
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>EditAddress()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressInfromation()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  'Home',
                                  textType: TextType.titleStyled,
                                  color: Palette.textColor,
                                  height: 1,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.assetsIconsPen2,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset(
                                        Assets.assetsIconsDelete,
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const Text(
                              "Akansha Das",
                              style: TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "2118,Thornidge Syracuse, Opposite Starbucks, Bandra East, Mumbai-356241,Maharasthra",
                              style: TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Phone number: 9876543210, 0123456789",
                              style: TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const TextView("Default Address"),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  "Parent's",
                                  textType: TextType.titleStyled,
                                  color: Palette.textColor,
                                  height: 1,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.assetsIconsPen2,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset(
                                        Assets.assetsIconsDelete,
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const TextView(
                              "Akshay Das",
                              size: 17,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "B-35, Sector-36,Near Cambridge Intl School, Noida- 201301, Uttar Pradesh",
                              style: TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Phone number: 9876543210, 0123456789",
                              style: TextStyle(fontSize: 17),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const TextView(
                              "Verification Pending",
                              size: 16,
                            ),
                          ],
                        ),
                      ),
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