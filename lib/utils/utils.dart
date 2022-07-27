import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

class Utils {
  static Future<void> push(context, widget) async {
    await Navigator.push(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static void pop(context) {
    Navigator.pop(context);
  }

  static Future<void> pushReplacement(context, widget) async {
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static Future<void> pushAndRemoveUntil(context, widget) async {
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) => widget), (route) => false);
  }

  static Future<Widget?> showPrimaryBottomSheet(BuildContext context, {required Widget child}) {
    return showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (_) => child,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }

  static Future<Widget?> showPrimaryDialog(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Widget child,
    VoidCallback? onDone,
    VoidCallback? onCancel,
  }) {
    return showDialog<Widget>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: Dimensions.radius10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding, vertical: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          TextView(
                            title,
                            color: Palette.textColor,
                            textType: TextType.header2,
                            height: 1,
                          ),
                          TextView(
                            ' - $subtitle',
                            color: Palette.textColor,
                            textType: TextType.regular,
                            height: 0.7,
                          ),
                        ],
                      ),
                      10.0.height,
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Palette.surfaceColor,
                      ),
                      Dimensions.defaultPadding.height,
                      child,
                      30.0.height,
                      PrimaryButton(
                        title: 'done',
                        onPressed: onDone,
                        width: 130,
                      ),
                      Dimensions.defaultPadding.height,
                      PrimaryButton(
                        title: 'cancel',
                        onPressed: onCancel ?? () => Utils.pop(context),
                        width: 130,
                        colorFill: false,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: PrimaryIconButton(
                    svg: Assets.assetsIconsCrossRound,
                    padding: const EdgeInsets.all(10.0),
                    size: 16,
                    onPressed: () => Utils.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
