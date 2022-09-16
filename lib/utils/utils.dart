import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

enum SnackType {
  error,
  success,
  invalidated,
  info,
  debug,
  debugError,
}

class Utils {
  static Future<Object?> push(BuildContext context, widget) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static void pop(BuildContext context, [result]) {
    return Navigator.pop(context, result);
  }

  static Future<void> pushReplacement(BuildContext context, widget) async {
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static Future<void> pushAndRemoveUntil(BuildContext context, widget) async {
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) => widget), (route) => false);
  }

  static String? dateFormatDMY(DateTime? date) {
    if (date != null) {
      return DateFormat('dd-MM-yyyy').format(date);
    } else {
      return null;
    }
  }

  static ScaffoldFeatureController showPrimarySnackbar(BuildContext context, text, {SnackType? type}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    Color? color, textColor;
    switch (type) {
      case SnackType.error:
        color = const Color(0xFFDC3545);
        textColor = Colors.white;
        break;
      case SnackType.invalidated:
        color = const Color(0xFFDC3545);
        textColor = Colors.white;
        break;
      case SnackType.success:
        color = const Color(0xFF28A745);
        textColor = Colors.white;
        break;
      case SnackType.info:
        color = Colors.grey;
        break;
      case SnackType.debug:
        if (kReleaseMode) break;
        debugPrint('\x1B[33mDebug: $text\x1B[0m');
        color = const Color(0xFFFFC107);
        textColor = const Color(0xFF343A40);
        text = 'Debug: $text';
        break;
      case SnackType.debugError:
        if (kReleaseMode) break;
        debugPrint('\x1B[31mDebugError: $text\x1B[0m');
        color = const Color.fromARGB(255, 255, 94, 7);
        textColor = Colors.white;
        text = 'Debug Error: $text';
        break;
      default:
        color = Colors.grey;
        break;
    }

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // margin: isOverSheet ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 1.6) : null,
        behavior: SnackBarBehavior.floating,
        content: TextView(
          text ?? '',
          color: textColor,
          size: 16,
          maxLines: 4,
        ),
        backgroundColor: color,
      ),
    );
  }

  static Future<Widget?> showPrimaryBottomSheet(BuildContext context, {required Widget child}) {
    return showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
        minHeight: 0,
      ),
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
    required final String headerTitle,
    final String? subheaderTitle,
    final String? bTitle,
    final Widget? child,
    final Future<void> Function()? onDone,
    final VoidCallback? onCancel,
    final Axis? direction,
  }) {
    return showDialog<Widget>(
      context: context,
      builder: (context) => Center(
        child: SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: Dimensions.radius10),
            insetPadding: const EdgeInsets.all(Dimensions.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding, vertical: 30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextView(
                                    headerTitle,
                                    textAlign: TextAlign.center,
                                    color: Palette.textColor,
                                    textType: TextType.header2,
                                    maxLines: 2,
                                    height: 1,
                                  ),
                                ),
                                if (subheaderTitle != null)
                                  TextView(
                                    ' - $subheaderTitle',
                                    color: Palette.textColor,
                                    textType: TextType.regular,
                                    height: 0.7,
                                  ),
                              ],
                            ),
                            10.0.height,
                            if (child != null)
                              const Divider(
                                height: 1,
                                thickness: 1,
                                color: Palette.surfaceColor,
                              ),
                            Dimensions.defaultPadding.height,
                            if (child != null) child,
                            if (child != null) 30.0.height,
                            Flex(
                              direction: direction ?? Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrimaryButton(
                                  title: bTitle ?? 'done',
                                  onPressed: () async {
                                    Utils.pop(context);
                                    await onDone?.call();
                                  },
                                  width: 130,
                                ),
                                Dimensions.defaultPadding.height,
                                Dimensions.defaultPadding.width,
                                PrimaryButton(
                                  title: 'cancel',
                                  onPressed: onCancel ?? () => Utils.pop(context),
                                  width: 130,
                                  isFilled: false,
                                ),
                              ],
                            ),
                          ],
                        ),
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
        ),
      ),
    );
  }
}
