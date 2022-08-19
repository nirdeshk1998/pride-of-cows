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

class ProductResModel {
  int? status;
  String? message;
  List? data;
  int? totalProduct;
  ProductResModel({
    this.status,
    this.message,
    this.data,
    this.totalProduct,
  });
  ProductResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["messgae"];
    data = json["data"];
    totalProduct = json["totalproduct"];
  }
}

class ProductListResModel {
  int? status;
  String? message;
  List<ProductData>? data;
  int? totalproduct;

  ProductListResModel({this.status, this.message, this.data, this.totalproduct});

  ProductListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
    totalproduct = json['totalproduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messgae'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalproduct'] = totalproduct;
    return data;
  }
}

class ProductData {
  String? id;
  String? name;
  String? description;
  String? productUnit;
  String? saleItem;
  String? thumb;
  String? mainImg;
  String? bannerImg;
  String? bannerWeb;
  String? tags;
  String? isSubscribe;
  String? price;
  int? taxprice;
  int? offerTax;
  int? discountprice;
  int? finalprice;
  String? minimumQuantity;
  String? isOrdered;

  ProductData(
      {this.id,
      this.name,
      this.description,
      this.productUnit,
      this.saleItem,
      this.thumb,
      this.mainImg,
      this.bannerImg,
      this.bannerWeb,
      this.tags,
      this.isSubscribe,
      this.price,
      this.taxprice,
      this.offerTax,
      this.discountprice,
      this.finalprice,
      this.minimumQuantity,
      this.isOrdered});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productUnit = json['product_unit'];
    saleItem = json['sale_item'];
    thumb = json['thumb'];
    mainImg = json['main_img'];
    bannerImg = json['banner_img'];
    bannerWeb = json['banner_web'];
    tags = json['tags'];
    isSubscribe = json['is_subscribe'];
    price = json['price'];
    taxprice = json['taxprice'];
    offerTax = json['offerTax'];
    discountprice = json['discountprice'];
    finalprice = json['finalprice'];
    minimumQuantity = json['minimum_quantity'];
    isOrdered = json['is_ordered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['product_unit'] = productUnit;
    data['sale_item'] = saleItem;
    data['thumb'] = thumb;
    data['main_img'] = mainImg;
    data['banner_img'] = bannerImg;
    data['banner_web'] = bannerWeb;
    data['tags'] = tags;
    data['is_subscribe'] = isSubscribe;
    data['price'] = price;
    data['taxprice'] = taxprice;
    data['offerTax'] = offerTax;
    data['discountprice'] = discountprice;
    data['finalprice'] = finalprice;
    data['minimum_quantity'] = minimumQuantity;
    data['is_ordered'] = isOrdered;
    return data;
  }
}
