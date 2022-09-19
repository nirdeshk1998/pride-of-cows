class DealsOffersResModel {
  int? status;
  String? message;
  List<DealsOffersData>? data;

  DealsOffersResModel({this.status, this.message, this.data});

  DealsOffersResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DealsOffersData>[];
      json['data'].forEach((v) {
        data!.add(DealsOffersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DealsOffersData {
  int? promocodeId;
  String? promocodeName;
  String? promoCode;
  String? thumbnailImage;
  String? promocodeType;
  String? validityEnd;
  String? validityStart;
  String? description;
  String? maxValue;
  String? minimumCartValue;
  String? promocodeDiscountValue;
  List<Products>? products;
  String? productsName;

  DealsOffersData(
      {this.promocodeId,
      this.promocodeName,
      this.promoCode,
      this.thumbnailImage,
      this.promocodeType,
      this.validityEnd,
      this.validityStart,
      this.description,
      this.maxValue,
      this.minimumCartValue,
      this.promocodeDiscountValue,
      this.products,
      this.productsName});

  DealsOffersData.fromJson(Map<String, dynamic> json) {
    promocodeId = json['promocode_id'];
    promocodeName = json['promocode_name'];
    promoCode = json['promo_code'];
    thumbnailImage = json['thumbnail_image'];
    promocodeType = json['promocode_type'];
    validityEnd = json['validity_end'];
    validityStart = json['validity_start'];
    description = json['description'];
    maxValue = json['max_value'];
    minimumCartValue = json['minimum_cart_value'];
    promocodeDiscountValue = json['promocode_discount_value'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    productsName = json['products_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['promocode_id'] = promocodeId;
    data['promocode_name'] = promocodeName;
    data['promo_code'] = promoCode;
    data['thumbnail_image'] = thumbnailImage;
    data['promocode_type'] = promocodeType;
    data['validity_end'] = validityEnd;
    data['validity_start'] = validityStart;
    data['description'] = description;
    data['max_value'] = maxValue;
    data['minimum_cart_value'] = minimumCartValue;
    data['promocode_discount_value'] = promocodeDiscountValue;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['products_name'] = productsName;
    return data;
  }
}

class Products {
  String? productId;
  String? productName;

  Products({this.productId, this.productName});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    return data;
  }
}

class ApplyOfferReqModel {
  String? userId;
  int? promoCodeId;
  ApplyOfferReqModel({this.userId, this.promoCodeId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["userID"] = userId;
    data["promocode_id"] = promoCodeId;
    return data;
  }
}
