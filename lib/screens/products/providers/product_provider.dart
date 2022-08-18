import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/products/data/models/category_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/screens/products/data/product_repository.dart';

final ProductProvider=ChangeNotifierProvider.autoDispose((ref)=>ProductNotifer());
final ProductRepository _productRepo=ProductRepository();
class ProductNotifer with ChangeNotifier{
List<dynamic> productList=<dynamic>[];
List<dynamic> categoryList=<dynamic>[];
void getProducts()async{
  final result=await _productRepo.getProductList(_productListModel);
   productList=result.data!;
   notifyListeners();
}
ProductReqModel get _productListModel=> ProductReqModel(
  catId: null,
  cityId: 329,
  perPage: 2,
  page: 3,
  userId: 143,
  search: "",

);
Future<void> getCatergory(context)async{
  await CategoryRepository().getCategoryList().then((response){
    final result=CategoryResModel.fromJson(response.data);
    categoryList=result.data!;
  });
}

}

