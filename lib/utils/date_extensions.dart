import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String? toddMMyyyy() => DateFormat('dd-MM-yyyy').format(this);
}
