class ProductDetailsReqModel {
  int? productId;
  int? cityId;

  ProductDetailsReqModel({
    this.productId,
    this.cityId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ProductID"] = productId;
    data["City"] = cityId;
    return data;
  }
}

class ProductDetailsResModel {
  int? status;
  String? message;
  ProductDetailsData? data;

  ProductDetailsResModel({this.status, this.message, this.data});

  ProductDetailsResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProductDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDetailsData {
  int? id;
  String? name;
  String? description;
  String? productUnit;
  String? saleItem;
  String? thumb;
  String? mainImg;
  String? bannerWeb;
  String? tags;
  int? isSubscribe;
  String? ingredient;
  String? ingredientHeading;
  String? ourBenefits;
  int? price;
  int? taxprice;
  int? offerTax;
  int? discountprice;
  int? finalprice;
  int? minimumQuantity;
  int? isMinimum;

  ProductDetailsData(
      {this.id,
      this.name,
      this.description,
      this.productUnit,
      this.saleItem,
      this.thumb,
      this.mainImg,
      this.bannerWeb,
      this.tags,
      this.isSubscribe,
      this.ingredient,
      this.ingredientHeading,
      this.ourBenefits,
      this.price,
      this.taxprice,
      this.offerTax,
      this.discountprice,
      this.finalprice,
      this.minimumQuantity,
      this.isMinimum});

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productUnit = json['product_unit'];
    saleItem = json['sale_item'];
    thumb = json['thumb'];
    mainImg = json['main_img'];
    bannerWeb = json['banner_web'];
    tags = json['tags'];
    isSubscribe = json['is_subscribe'];
    ingredient = json['ingredient'];
    ingredientHeading = json['ingredient_heading'];
    ourBenefits = json['our_benefits'];
    price = json['price'];
    taxprice = json['taxprice'];
    offerTax = json['offerTax'];
    discountprice = json['discountprice'];
    finalprice = json['finalprice'];
    minimumQuantity = json['minimum_quantity'];
    isMinimum = json['is_minimum'];
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
    data['banner_web'] = bannerWeb;
    data['tags'] = tags;
    data['is_subscribe'] = isSubscribe;
    data['ingredient'] = ingredient;
    data['ingredient_heading'] = ingredientHeading;
    data['our_benefits'] = ourBenefits;
    data['price'] = price;
    data['taxprice'] = taxprice;
    data['offerTax'] = offerTax;
    data['discountprice'] = discountprice;
    data['finalprice'] = finalprice;
    data['minimum_quantity'] = minimumQuantity;
    data['is_minimum'] = isMinimum;
    return data;
  }
}
