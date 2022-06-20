import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider.autoDispose((ref) => HomeChangeProvider());

class HomeChangeProvider with ChangeNotifier {
  DateTime currentDate = DateTime.now();
  List<String> weekNameList = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<String> imageList = [
    'https://i.pinimg.com/564x/41/54/46/415446f55e53b7d3ba09d3c3dc848d59.jpg',
    'https://i.pinimg.com/564x/03/8e/3f/038e3f67c94e85238182b45f5f1345f1.jpg',
    'https://i.pinimg.com/564x/92/5c/0b/925c0b7635ed386fe940736d3726297d.jpg',
  ];

  List<String> getCurrentWeek() {
    final DateTime startFrom = currentDate.subtract(Duration(days: currentDate.weekday));
    return List.generate(7, (i) => '${startFrom.add(Duration(days: i)).day}');
  }

  double progressWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width - 100);
  }
}
