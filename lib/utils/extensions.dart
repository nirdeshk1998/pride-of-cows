import 'package:flutter/cupertino.dart';

extension Margin on double {
  SizedBox get height => SizedBox(height: this);
  SizedBox get width => SizedBox(width: this);
}
