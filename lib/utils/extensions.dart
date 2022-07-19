import 'package:flutter/cupertino.dart';

extension Margin on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}
