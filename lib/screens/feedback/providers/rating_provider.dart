import 'package:poc/utils/base_provider.dart';

final ratingProvider = ChangeNotifierProvider<RatingProvider>((ref) {
  return RatingProvider();
});

class RatingProvider extends BaseChangeNotifier {
  //

  @override
  Future<void> postCreateState() async {
    //
  }
}
