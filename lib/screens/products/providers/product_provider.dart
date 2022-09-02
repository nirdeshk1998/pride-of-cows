import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/screens/products/data/product_repository.dart';
import 'package:poc/utils/utils.dart';

final productProvider = ChangeNotifierProvider.autoDispose((ref) => ProductChangeProvider());

class ProductChangeProvider extends ChangeNotifier {
  final ProductRepository _productRepo = ProductRepository();

  List<ProductData>? _productList;
  List<CategoryData>? _categoryList;

  List<CategoryData>? get categoryList => _categoryList;
  List<ProductData>? get productList => _productList;

  int? categoryId;

  Future<void> initState(BuildContext context) async {
    print(context);
    await _getCatergory(context);
    await _getProducts(context);
  }

  ProductReqModel get _productListModel => ProductReqModel(
        catId: categoryId,
        cityId: 329,
        perPage: 2,
        page: 3,
        userId: 143,
        search: "",
      );

  Future<void> _getProducts(context) async {
    await _productRepo.getProductList(_productListModel).then((response) {
      final result = ProductListResModel.fromJson(response.data);
      if(result.data!=null){
        if (response.statusCode == 200) {
          _productList = result.data;
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message,type:SnackType.error );
        }
      }
      else{
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
      }

    }).onError((error, stackTrace){
      Utils.showPrimarySnackbar(context, error.toString(), type: SnackType.debug);
    } );
  }

  Future<void> _getCatergory(context) async {
    await _productRepo.getCategoryList().then((response) {
      final result = CategoryListResModel.fromJson(response.data);

      if (response.statusCode == 200) {
        _categoryList = result.data;
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      } else {
        Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error.toString(), type: SnackType.debug);
    });
  }

  void getSelectedCategoryId(catId)async{
    categoryId=catId;
  }
  void getSelectedProductList(context)async{
    await _getProducts(context);
  }
}
 