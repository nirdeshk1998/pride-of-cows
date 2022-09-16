class UserCartReqModel {
  String? userId;
  String? cityId;
  String? pincode;

  UserCartReqModel({this.userId, this.cityId, this.pincode});

  UserCartReqModel.fromJson(Map<String, dynamic> json) {
    userId = json['userID'];
    cityId = json['city_id'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['city_id'] = cityId;
    data['pincode'] = pincode;
    return data;
  }
}

class UserCartResModel {
  int? status;
  String? message;
  List<CartItemsData>? cartItems;
  List<MoreProducts>? moreProducts;
  int? totalPrice;
  int? totalItems;

  UserCartResModel({this.status, this.message, this.cartItems, this.moreProducts, this.totalPrice, this.totalItems});

  UserCartResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['cartItems'] != null) {
      cartItems = <CartItemsData>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItemsData.fromJson(v));
      });
    }
    if (json['moreProducts'] != null) {
      moreProducts = <MoreProducts>[];
      json['moreProducts'].forEach((v) {
        moreProducts!.add(MoreProducts.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    totalItems = json['total_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (cartItems != null) {
      data['cartItems'] = cartItems!.map((v) => v.toJson()).toList();
    }
    if (moreProducts != null) {
      data['moreProducts'] = moreProducts!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    data['total_items'] = totalItems;
    return data;
  }
}

class CartItemsData {
  int? itemId;
  int? productId;
  String? giftId;
  String? productName;
  String? thumbImg;
  int? quantity;
  int? itemPrice;
  int? totalPrice;
  String? deliveryPlan;
  String? cartType;
  String? giftType;
  int? dicountPrice;
  int? discount;
  String? startDate;
  String? endDate;
  int? repeatMonthly;
  int? noOfDays;
  String? createdAt;
  String? updatedAt;
  int? productAvailable;
  int? pincodeServiceable;

  CartItemsData(
      {this.itemId,
      this.productId,
      this.giftId,
      this.productName,
      this.thumbImg,
      this.quantity,
      this.itemPrice,
      this.totalPrice,
      this.deliveryPlan,
      this.cartType,
      this.giftType,
      this.dicountPrice,
      this.discount,
      this.startDate,
      this.endDate,
      this.noOfDays,
      this.repeatMonthly,
      this.createdAt,
      this.updatedAt,
      this.productAvailable,
      this.pincodeServiceable});

  CartItemsData.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    productId = json['product_id'];
    giftId = json['gift_id'];
    noOfDays = json['noOfDays'];
    productName = json['product_name'];
    thumbImg = json['thumb_img'];
    quantity = json['quantity'];
    itemPrice = json['item_price'];
    totalPrice = json['total_price'];
    deliveryPlan = json['delivery_plan'];
    cartType = json['cart_type'];
    giftType = json['gift_type'];
    dicountPrice = json['dicount_price'];
    discount = json['discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    repeatMonthly = json['repeat_monthly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productAvailable = json['productAvailable'];
    pincodeServiceable = json['pincodeServiceable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['product_id'] = productId;
    data['gift_id'] = giftId;
    data['noOfDays'] = noOfDays;
    data['product_name'] = productName;
    data['thumb_img'] = thumbImg;
    data['quantity'] = quantity;
    data['item_price'] = itemPrice;
    data['total_price'] = totalPrice;
    data['delivery_plan'] = deliveryPlan;
    data['cart_type'] = cartType;
    data['gift_type'] = giftType;
    data['dicount_price'] = dicountPrice;
    data['discount'] = discount;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['repeat_monthly'] = repeatMonthly;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['productAvailable'] = productAvailable;
    data['pincodeServiceable'] = pincodeServiceable;
    return data;
  }
}

class MoreProducts {
  int? productId;
  String? productName;
  String? thumbImg;
  int? price;

  MoreProducts({this.productId, this.productName, this.thumbImg, this.price});

  MoreProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    thumbImg = json['thumb_img'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['thumb_img'] = thumbImg;
    data['price'] = price;
    return data;
  }
}
