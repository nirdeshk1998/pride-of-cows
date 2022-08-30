import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/screens/address/provider/my_address_book_provider.dart';
import 'package:poc/screens/address/address_information_screen.dart';
import 'package:poc/screens/address/create_update_address_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/styles/text_styles.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/appbar.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/loader.dart';
import 'package:poc/widgets/text_view.dart';

class MyAddressBook extends ConsumerWidget {
  const MyAddressBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(addressbookProvider);
    final watch = ref.watch(addressbookProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => read.initState(context),
    );

    return Scaffold(
      body: StackedLoader(
        isLoading: watch.isLoading,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SecondaryAppBar(),
            Dimensions.defaultPadding.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      TextView(
                        'My Address Book',
                        textType: TextType.header,
                        height: 1,
                      ),
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
                          Utils.push(
                            context,
                            const CreateUpdateAddressScreen(addressType: AddressType.add),
                          );
                        },
                      ),
                    ],
                  ),
                  ListView.separated(
                    itemCount: watch.addressBookData?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) => Dimensions.defaultPadding.height,
                    itemBuilder: (BuildContext context, int index) {
                      final element = watch.addressBookData?[index];
                      return InkWell(
                        onTap: () => Utils.push(context, const AddressInfromation()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: const Color(0xffFAFAFA),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              10.0.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextView(
                                    element?.selectType?.capitalize ?? 'N/A',
                                    textType: TextType.titleStyled,
                                    height: 1,
                                  ),
                                  const Spacer(),
                                  PrimaryIconButton(
                                    svg: Assets.assetsIconsPencil,
                                    color: Palette.lightIconColor,
                                    onPressed: () {
                                      Utils.push(
                                        context,
                                        const CreateUpdateAddressScreen(addressType: AddressType.edit),
                                      );
                                    },
                                    size: 20.0,
                                  ),
                                  15.0.width,
                                  PrimaryIconButton(
                                    svg: Assets.assetsIconsDelete,
                                    color: Palette.lightIconColor,
                                    onPressed: () {},
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              5.0.height,
                              const Divider(height: 1),
                              10.0.height,
                              TextView(
                                element?.name ?? 'N/A',
                                size: TextSize.regularLarge,
                                height: 1,
                              ),
                              5.0.height,
                              TextView(
                                '${element?.address1} ${element?.address2} ${element?.address3} - ${element?.pincode}'
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
                              const Divider(height: 1),
                              10.0.height,
                              TextView(
                                (element?.defaultAddress ?? '').contains('yes') ? 'Default Address' : 'Inactive',
                                height: 1,
                              ),
                              10.0.height,
                            ],
                          ),
                        ),
                      );
                    },
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
