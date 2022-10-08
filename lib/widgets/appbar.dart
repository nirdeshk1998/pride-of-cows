import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/available_pincode_model.dart';
import 'package:poc/network/repository.dart';
import 'package:poc/screens/search/search_screen.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/form_fields.dart';
import 'package:poc/widgets/text_view.dart';

final appbarProvider = ChangeNotifierProvider<AppBarChangeProvider>((ref) {
  return AppBarChangeProvider();
});

class AppBarChangeProvider extends BaseChangeNotifier {
  final ListDataRepository _listDataRepo = ListDataRepository();

  String? _userId, _pincode;
  List<AvailablePincodeData>? _availablePincodeList;
  AvailablePincodeData? _selectedValue;

  List<AvailablePincodeData>? get availablePincodeList => _availablePincodeList;
  AvailablePincodeData? get selectedValue => _selectedValue;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _userCartRequest();
  }

  Future<void> _userCartRequest() async {
    await _listDataRepo.availablePincodeRepo(_userId ?? '').then(
      (response) async {
        final result = AvailablePincodeResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          _availablePincodeList = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        showLoader(false);   
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.debug);
      },
    ).catchError(
      (Object e) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
    _pincode = await LocalStorage.getString(StorageField.pincode);
  }

  void onSelected(AvailablePincodeData value) {
    _selectedValue = value;
    notifyListeners();
  }
}

class PrimaryAppBar extends ConsumerWidget {
  const PrimaryAppBar({
    Key? key,
    required this.showSearch,
    this.controller,
  }) : super(key: key);

  final bool showSearch;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(appbarProvider);
    final watch = ref.watch(appbarProvider);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      read.initState(context);
    });

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(238, 249, 255, 1), Color.fromRGBO(234, 247, 254, 1)],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox.square(dimension: 20),
                  SvgPicture.asset(Assets.assetsIconsPin),
                  // const SizedBox.square(dimension: 3),
                  PopupMenuButton<AvailablePincodeData>(
                    offset: const Offset(0, 36),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      child: Row(
                        children: [
                          Text(
                            watch.selectedValue?.cityName ?? 'Select Location',
                            style: TextStyle(
                              color: Palette.primaryColor,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            watch.selectedValue?.pincode != null ? ' (${watch.selectedValue?.pincode})' : '',
                            style: TextStyle(
                              color: const Color(0xFF658395),
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: SvgPicture.asset(
                              Assets.assetsIconsChevronDown,
                              color: const Color(0xFF9DBACA),
                              height: 6,
                              width: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onSelected: (value) => read.onSelected(value),
                    itemBuilder: (context) => List.generate(
                      watch.availablePincodeList?.length ?? 0,
                      (index) {
                        final element = watch.availablePincodeList?[index];
                        return PopupMenuItem(
                          value: element,
                          child: Text('${element?.cityName} (${element?.pincode})'),
                        );
                      },
                    ),
                  ),
                  // ButtonTheme(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: Dimensions.radius20,
                  //   ),

                  //   // data: ThemeData(
                  //   //   splashColor: Colors.transparent,
                  //   //   // highlightColor: Colors.transparent,
                  //   //   hoverColor: Colors.transparent,
                  //   //   splashFactory: NoSplash.splashFactory,

                  //   // ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton<String>(
                  //       // value: 0,
                  //       value: watch.selectedValue,
                  //       isDense: true,
                  //       isExpanded: false,
                  //       alignment: Alignment.centerLeft,
                  //       // selectedItemBuilder: (context) => [
                  //       //   Text(
                  //       //     watch.selectedValue ?? 'N/A',
                  //       //     style: TextStyle(
                  //       //       color: Palette.primaryColor,
                  //       //       fontFamily: GoogleFonts.lato().fontFamily,
                  //       //       fontSize: 14,
                  //       //       letterSpacing: 0,
                  //       //       fontWeight: FontWeight.normal,
                  //       //     ),
                  //       //   ),
                  //       //   Text(
                  //       //     ' (${watch.selectedValue ?? 'N/A'})',
                  //       //     style: TextStyle(
                  //       //       color: const Color(0xFF658395),
                  //       //       fontFamily: GoogleFonts.lato().fontFamily,
                  //       //       fontSize: 14,
                  //       //       letterSpacing: 0,
                  //       //       fontWeight: FontWeight.normal,
                  //       //     ),
                  //       //   ),
                  //       // ],
                  //       hint: Text(
                  //         'Select Pincode',
                  //         style: TextStyle(
                  //           color: Palette.primaryColor,
                  //           fontFamily: GoogleFonts.lato().fontFamily,
                  //           fontSize: 14,
                  //           letterSpacing: 0,
                  //           fontWeight: FontWeight.normal,
                  //         ),
                  //       ),
                  //       icon: Padding(
                  //         padding: const EdgeInsets.only(left: 6.0),
                  //         child: SvgPicture.asset(
                  //           Assets.assetsIconsChevronDown,
                  //           color: const Color(0xFF9DBACA),
                  //           height: 6,
                  //           width: 12,
                  //         ),
                  //       ),
                  //       onChanged: (i) => read.onSelected(i),

                  //       items: watch.availablePincodeList
                  //           ?.map((e) => DropdownMenuItem(
                  //                 value: e.id,
                  //                 child: Row(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   children: [
                  //                     Text(
                  //                       e.cityName ?? 'N/A',
                  //                       style: TextStyle(
                  //                         color: Palette.primaryColor,
                  //                         fontFamily: GoogleFonts.lato().fontFamily,
                  //                         fontSize: 14,
                  //                         letterSpacing: 0,
                  //                         fontWeight: FontWeight.normal,
                  //                       ),
                  //                     ),
                  //                     Text(
                  //                       ' (${e.pincode ?? 'N/A'})',
                  //                       style: TextStyle(
                  //                         color: const Color(0xFF658395),
                  //                         fontFamily: GoogleFonts.lato().fontFamily,
                  //                         fontSize: 14,
                  //                         letterSpacing: 0,
                  //                         fontWeight: FontWeight.normal,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ))
                  //           .toList(),
                  //     ),
                  //   ),
                  // ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Utils.push(context, const SearchScreen());
                    },
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsSearch),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsCalendar),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 28,
                    icon: SvgPicture.asset(Assets.assetsIconsBellDot),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox.square(dimension: 12),
                ],
              ),
            ),
            Visibility(
              visible: showSearch,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: SearchFormField(
                  hintText: 'Search for products',
                  controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimarySearchAppBar extends StatelessWidget {
  const PrimarySearchAppBar({
    Key? key,
    this.controller,
    this.onClearPressed,
  }) : super(key: key);

  final TextEditingController? controller;
  final VoidCallback? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(238, 249, 255, 1), Color.fromRGBO(234, 247, 254, 1)],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox.square(dimension: 9.5),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    splashRadius: 28,
                    iconSize: 24,
                    color: Palette.primaryColor,
                    icon: SizedBox.square(
                      dimension: 24,
                      child: SvgPicture.asset(
                        Assets.assetsIconsBack,
                        fit: BoxFit.contain,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.5),
                    constraints: const BoxConstraints(),
                  ),
                  const Spacer(),
                  // IconButton(
                  //   onPressed: () {
                  //     controller?.clear();
                  //     onClearPressed?.call();
                  //   },
                  //   splashRadius: 28,
                  //   iconSize: 24,
                  //   color: Palette.primaryColor,
                  //   icon: SizedBox.square(
                  //     dimension: 24,
                  //     child: SvgPicture.asset(
                  //       Assets.assetsIconsClose,
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  //   padding: const EdgeInsets.all(10.5),
                  //   constraints: const BoxConstraints(),
                  // ),
                  const SizedBox.square(dimension: 9.5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: SearchFormField(
                hintText: 'Enter here',
                controller: controller,
                suffix: InkWell(
                  onTap: () {
                    controller?.clear();
                  },
                  child: const TextView(
                    "Clear",
                    color: Palette.hintColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryAppBar extends StatelessWidget {
  const SecondaryAppBar({
    Key? key,
    this.sOnPressed,
    this.sIcon,
    this.color,
  }) : super(key: key);

  final VoidCallback? sOnPressed;
  final String? sIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: color ?? Palette.scaffoldBackgroundColor),
      child: SizedBox(
        height: kToolbarHeight,
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 9.5),
              IconButton(
                onPressed: () => Navigator.pop(context),
                splashRadius: 28,
                iconSize: 24,
                color: Palette.primaryColor,
                icon: SvgPicture.asset(Assets.assetsIconsBack),
                padding: const EdgeInsets.all(10.5),
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              if (sIcon != null)
                IconButton(
                  onPressed: sOnPressed,
                  splashRadius: 28,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(sIcon ?? ''),
                  padding: const EdgeInsets.all(10.5),
                  constraints: const BoxConstraints(),
                ),
              const SizedBox.square(dimension: 9.5),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({
    Key? key,
    this.sOnPressed,
    this.sIcon,
    this.color,
    this.sIcon2,
    this.sicon3,
  }) : super(key: key);

  final VoidCallback? sOnPressed;
  final String? sIcon;
  final Color? color;
  final String? sIcon2;
  final String? sicon3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: color ?? Palette.scaffoldBackgroundColor),
      child: SizedBox(
        height: kToolbarHeight,
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 9.5),
              IconButton(
                onPressed: () => Navigator.pop(context),
                splashRadius: 28,
                iconSize: 24,
                color: Palette.primaryColor,
                icon: SvgPicture.asset(Assets.assetsIconsBack),
                padding: const EdgeInsets.all(10.5),
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              if (sIcon != null)
                IconButton(
                  onPressed: sOnPressed,
                  splashRadius: 28,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(sIcon ?? ''),
                  padding: const EdgeInsets.all(10.5),
                  constraints: const BoxConstraints(),
                ),
              const SizedBox.square(dimension: 1.5),
              if (sIcon2 != null)
                IconButton(
                  onPressed: sOnPressed,
                  splashRadius: 28,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(sIcon2 ?? ''),
                  padding: const EdgeInsets.all(10.5),
                  constraints: const BoxConstraints(),
                ),
              const SizedBox.square(dimension: 1.5),
              if (sicon3 != null)
                IconButton(
                  onPressed: sOnPressed,
                  splashRadius: 28,
                  iconSize: 24,
                  color: Palette.primaryColor,
                  icon: SvgPicture.asset(sicon3 ?? ''),
                  padding: const EdgeInsets.all(10.5),
                  constraints: const BoxConstraints(),
                ),
              const SizedBox.square(dimension: 1.5),
            ],
          ),
        ),
      ),
    );
  }
}
