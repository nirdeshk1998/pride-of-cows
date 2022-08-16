import 'package:poc/utils/enums.dart';

class ProductReqModel {
  int? catId;
  int? cityId;
  int? perPage;
  int? page;
  int? userId;
  String? search;

  ProductReqModel({
    this.catId,
    this.cityId,
    this.perPage,
    this.page,
    this.userId,
    this.search,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cat_id"] = catId;
    data["city_id"] = cityId;
    data["per_page"] = perPage;
    data["page"] = page;
    data["userID"] = userId;
    data["search"] = search;
    return data;
  }
}
class ProductResModel{
  int? status;
  String? message;
  List ? data;
  int? totalProduct;
  ProductResModel({
    this.status,
    this.message,
    this.data,
    this.totalProduct,
});
  ProductResModel.fromJson(Map<String,dynamic> json){
    print(json);
    status=json["status"];
    message=json["messgae"];
    data=json["data"];
    totalProduct=json["totalproduct"];
  }
}
