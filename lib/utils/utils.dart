import 'package:flutter/material.dart';

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

  static Future<Widget?> bottomSheet(BuildContext context, {required Widget child}) {
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
}
