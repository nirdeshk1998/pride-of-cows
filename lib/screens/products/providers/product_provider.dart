import 'package:flutter/cupertino.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/screens/products/data/product_repository.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/utils.dart';

final productProvider = ChangeNotifierProvider.autoDispose((ref) => ProductChangeProvider());

class ProductChangeProvider extends BaseChangeNotifier {
  final ProductRepository _productRepo = ProductRepository();

  final List<ProductData> _productList = [];
  List<CategoryData>? _categoryList;
  @override
  bool isLoading = false;
  bool allLoaded = false;
  ScrollController scrollController = ScrollController();
  List<CategoryData>? get categoryList => _categoryList;
  List<ProductData>? get productList => _productList;
  int page = 1;
  int? categoryId;

  List<ProductData> savedList = [];

  @override
  Future<void> postCreateState() async {
    await _getCatergory();
    await getSelectedProductList(0);
  }

  Future<void> getProductsByCatRequest(ProductReqModel productReqModel) async {
    await _productRepo.getProductList(productReqModel).then(
      (response) async {
        final result = ProductListResModel.fromJson(response.data);
        if (response.statusCode == 200) {


          _productList.addAll(result.data ?? []);



          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _getCatergory() async {
    await _productRepo.getCategoryList().then(
      (response) {
        final result = CategoryListResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _categoryList = result.data;
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  // void getSelectedCategoryId(catId) async {
  //   categoryId = catId;
  // }

  // ProductReqModel get _productListModel => ProductReqModel(
  //       catId: categoryId,
  //       cityId: 329,
  //       perPage: 2,
  //       page: 3,
  //       userId: 143,
  //       search: "",
  //     );


  Future<void> clearProductList()async{
    _productList.clear();
  }

  Future<void> getSelectedProductList(int index) async {
    showLoader(true);
    allLoaded=false;
    final catId = _categoryList?[index].catId;
    categoryId = _categoryList?[index].catId;

    ProductReqModel req = ProductReqModel(
      catId: catId,
      cityId: 329,
      perPage: 5,
      page: page,
      userId: 143,
      search: "",
    );

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        showLoader(true);
        ProductReqModel req = ProductReqModel(
          catId: catId,
          cityId: 329,
          perPage: 5,
          page: page + 1,
          userId: 143,
          search: "",
        );
        await getProductsByCatRequest(req);
        showLoader(false);
        return;

      }
    });
    await clearProductList();

    await getProductsByCatRequest(req);
    allLoaded=true;
    showLoader(false);

    notifyListeners();
  }

}
