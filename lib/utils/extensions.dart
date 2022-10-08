import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Margin on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String? toddMMyy() {
    final dT = DateTime.parse(this);
    return DateFormat('dd-MM-yy').format(dT);
  }
}
