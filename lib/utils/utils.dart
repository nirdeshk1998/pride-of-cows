import 'package:flutter/material.dart';

class Utils {
  static void push(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static void pushReplacement(context, widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => widget));
  }

  static void pushAndRemoveUntil(context, widget) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) => widget), (route) => false);
  }
}
