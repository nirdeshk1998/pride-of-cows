import 'package:poc/screens/search/data/models/product_search_model.dart';
import 'package:poc/screens/search/data/search_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final searchProvider = ChangeNotifierProvider.autoDispose<SearchChangeProvider>(
  (ref) => SearchChangeProvider(ref),
);

class SearchChangeProvider extends BaseChangeNotifier {
  AutoDisposeChangeNotifierProviderRef<SearchChangeProvider> ref;
  SearchChangeProvider(this.ref) : super();

  final SearchRepository _searchRepo = SearchRepository();

  bool _isShowResult = false;
  String? _userId;
  List<ProductSearchData>? _searchData;
  String? _keyword;

  String? get keyword => _keyword;
  bool get isShowResult => _isShowResult;
  List<ProductSearchData>? get searchData => _searchData;
  ProductSearchReqModel get _productSearchReqModel => ProductSearchReqModel(
        catId: null,
        cityId: 329,
        page: 1,
        perPage: 10,
        userID: _userId,
        search: _keyword,
      );

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    _keyword = data;

    if (data != null) {
      await onSearch(data);
    }
  }

  void showResult(bool value) {
    _isShowResult = value;
    notifyListeners();
  }

  void onTextClear() {
    _keyword = null;
    showResult(false);
  }

  Future<void> onSearch(String? keyword) async {
    _keyword = keyword;

    showLoader(true);
    await _onSearchRequest();
    showLoader(false);
  }

  Future<void> _onSearchRequest() async {
    if(_keyword == null ||_keyword?.isEmpty == true) return;
    
    await _searchRepo.productSearch(_productSearchReqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = ProductSearchResModel.fromJson(response.data);

        _searchData = result.data;

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
        showResult(true);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
