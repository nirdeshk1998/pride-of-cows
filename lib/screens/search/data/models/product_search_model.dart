class ProductSearchReqModel {
  int? catId;
  int? cityId;
  int? perPage;
  int? page;
  String? userID;
  String? search;

  ProductSearchReqModel(
      {this.catId,
      this.cityId,
      this.perPage,
      this.page,
      this.userID,
      this.search});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_id'] = catId;
    data['city_id'] = cityId;
    data['per_page'] = perPage;
    data['page'] = page;
    data['userID'] = userID;
    data['search'] = search;
    return data;
  }
}

class ProductSearchResModel {
  int? status;
  String? message;
  List<ProductSearchData>? data;
  int? totalproduct;

  ProductSearchResModel(
      {this.status, this.message, this.data, this.totalproduct});

  ProductSearchResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductSearchData>[];
      json['data'].forEach((v) {
        data!.add(ProductSearchData.fromJson(v));
      });
    }
    totalproduct = json['totalproduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalproduct'] = totalproduct;
    return data;
  }
}

class ProductSearchData {
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
  String? finalprice;
  String? minimumQuantity;
  int? isOrdered;

  ProductSearchData(
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

  ProductSearchData.fromJson(Map<String, dynamic> json) {
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

