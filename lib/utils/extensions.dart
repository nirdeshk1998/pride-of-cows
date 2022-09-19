import 'package:flutter/material.dart';

extension Margin on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
