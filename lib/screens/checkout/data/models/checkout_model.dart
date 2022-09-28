import 'package:poc/screens/cart/data/models/get_cart_model.dart';

class CheckoutReqModel {
  int? userId;
  int? cityId;
  String? pincode;

  CheckoutReqModel({
    this.userId,
    this.cityId,
    this.pincode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["userID"] = userId;
    data["city_id"] = cityId;
    data["pincode"] = pincode;
    // print(data);
    return data;
  }
}

class CheckoutResModel {
  int? status;
  String? message;
  List<CartItemsData>? cartItems;
  String? totalPrice;
  int? totalItems;
  CheckoutData? checkOut;

  PromocodeData? promoCode;

  CheckoutResModel({
    this.status,
    this.message,
    this.cartItems,
    this.totalPrice,
    this.totalItems,
    this.checkOut,
    this.promoCode,
  });

  CheckoutResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    if (json["cartItems"] != null) {
      cartItems = <CartItemsData>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItemsData.fromJson(v));
      });
    }
    totalItems = json["total_items"];
    totalPrice = json["total_price"];
    // if(json["checkout"]!=null){
    //   checkOut = json["checkout"];
    // }
    checkOut = json['checkout'] != null
        ? CheckoutData.fromJson(json['checkout'])
        : null;
    promoCode = json['promocode'] != null
        ? PromocodeData.fromJson(json['promocode'])
        : null;
    // promoCode=json["promocode"];
  }
}

// class CartItemData {
//   int? itemId;
//   int? productId;
//   String? productName;
//   String? thumbImage;
//   int? qty;
//   int? itemPrice;
//   int? totalPrice;
//   String? deliveryPlan;
//   int? noOfDays;
//   String? cartType;
//   String? giftType;
//   int? discountPrice;
//   int? discount;
//   String? startDate;
//   String? endDate;
//   int? repeatMonthly;
//   String? createdAt;
//   String? upDatedAt;
//   int? productAvailable;
//   int? pincodeServiceable;
//
//   CartItemData({
//     this.itemId,
//     this.productId,
//     this.productName,
//     this.thumbImage,
//     this.qty,
//     this.itemPrice,
//     this.totalPrice,
//     this.deliveryPlan,
//     this.noOfDays,
//     this.cartType,
//     this.createdAt,
//     this.discount,
//     this.discountPrice,
//     this.endDate,
//     this.giftType,
//     this.pincodeServiceable,
//     this.productAvailable,
//     this.repeatMonthly,
//     this.startDate,
//     this.upDatedAt,
//   });
//
//   CartItemData.fromJson(Map<String, dynamic> json) {
//     itemId = json["item_id"];
//     productId = json["product_id"];
//     productName = json["product_name"];
//     thumbImage = json["thumb_img"];
//     qty = json["quantity"];
//     itemPrice = json["item_price"];
//     totalPrice = json["total_price"];
//     deliveryPlan = json["delivery_plan"];
//     noOfDays = json["noOfDays"];
//     cartType = json["cart_type"];
//     giftType = json["gift_type"];
//     discountPrice = json["dicount_price"];
//     discount = json["discount"];
//     startDate = json["start_date"];
//     endDate = json["end_date"];
//     repeatMonthly = json["repeat_monthly"];
//     createdAt = json["created_at"];
//     upDatedAt = json["updated_at"];
//     productAvailable = json["productAvailable"];
//     pincodeServiceable = json["pincodeServiceable"];
//   }
//   Map<String,dynamic> toJson(){
//     final Map<String,dynamic> data={};
//     data["item_id"]=itemId;
//     data["product_id"]=productId;
//     data["product_name"]=productName;
//     data["thumb_img"]=thumbImage;
//     data["quantity"]=qty;
//     data["item_price"]=itemPrice;
//     data["total_price"]=totalPrice;
//     data["delivery_plan"]=deliveryPlan;
//     data["noOfDays"]=noOfDays;
//     data["cart_type"]=cartType;
//     data["gift_type"]=giftType;
//     data["dicount_price"]=discountPrice;
//     data["discount"]=discount;
//     data["start_date"]=startDate;
//     data["end_date"]=endDate;
//     data["repeatMonthly"]=repeatMonthly;
//     data["createdAt"]=createdAt;
//     data["upDatedAt"]=upDatedAt;
//     data["productAvailable"]=productAvailable;
//     data["pincodeServiceable"]=pincodeServiceable;
//     return data;
//   }
// }

class CheckoutData {
  int? id;
  String? discountValue;
  String? walletDiscount;
  int? rewardId;
  String? rewardDiscount;

  // String? tax;
  String? deliveryFee;
  String? deliveryInstruction;
  String? cartPrice;
  String? totalTaxes;
  int? totalPrice;
  String? status;
  String? createdAt;
  String? upDatedAt;
  int? userId;
  int? promocodeId;
  int? userDeliveryAddressId;
  String? paymentMethod;

  CheckoutData({
    this.id,
    this.discountValue,
    this.upDatedAt,
    this.createdAt,
    this.totalPrice,
    this.status,
    this.userId,
    this.cartPrice,
    this.deliveryFee,
    this.deliveryInstruction,
    this.paymentMethod,
    this.promocodeId,
    this.rewardDiscount,
    this.rewardId,
    this.totalTaxes,
    // this.tax,
    this.userDeliveryAddressId,
    this.walletDiscount,
  });

  CheckoutData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    discountValue = json["discountValue"];
    walletDiscount = json["walletDiscount"];
    rewardId = json["rewardId"];
    rewardDiscount = json["rewardDiscount"];
    // tax = json["tax"];
    deliveryFee = json["deliveryFee"];
    deliveryInstruction = json["deliveryInstruction"];
    cartPrice = json["cartPrice"];
    totalPrice = json["totalPrice"];
    status = json["status"];
    createdAt = json["createdAt"];
    upDatedAt = json["updatedAt"];
    userId = json["userId"];
    promocodeId = json["promocodeId"];
    userDeliveryAddressId = json["userDeliveryAddressId"];
    paymentMethod = json["payment_method"];
    totalTaxes = json["taxPriceTotal"];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = {};
//   data["id"] = id;
//   data["discountValue"] = discountValue;
//   data["walletDiscount"] = walletDiscount;
//   data["rewardId"] = rewardId;
//   data["rewardDiscount"] = rewardDiscount;
//   data["tax"] = tax;
//   data["deliveryFee"] = deliveryFee;
//   data["deliveryInstruction"] = deliveryInstruction;
//   data["cartPrice"] = cartPrice;
//   data["totalPrice"] = totalPrice;
//   data["status"] = status;
//   data["createdAt"] = createdAt;
//   data["updatedAt"] = upDatedAt;
//   data["userId"] = userId;
//   data["promocodeId"] = promocodeId;
//   data["userDeliveryAddressId"] = userDeliveryAddressId;
//   data["payment_method"] = paymentMethod;
//   return data;
// }
}

class PromocodeData {
  int? promoCodeId;
  String? promoCodeName;
  String? promoCode;
  String? description;
  String? thumbnailImage;
  String? promoCodeType;
  String? promoCodeDiscountValue;
  String? maxValue;
  String? minCartValue;
  String? category;
  String? product;
  int? usesLimit;
  int? usesNumber;
  String? validityStart;
  String? validityEnd;
  String? customerType;
  String? status;
  String? promoCodeFor;
  int? numUsed;
  String? userType;
  String? createdAt;
  String? upDatedAt;
  int? createdBy;

  PromocodeData({
    this.status,
    this.createdAt,
    this.upDatedAt,
    this.promoCodeId,
    this.description,
    this.promoCodeDiscountValue,
    this.promoCodeName,
    this.promoCode,
    this.minCartValue,
    this.maxValue,
    this.validityStart,
    this.validityEnd,
    this.promoCodeType,
    this.customerType,
    this.category,
    this.createdBy,
    this.product,
    this.promoCodeFor,
    this.thumbnailImage,
    this.usesLimit,
    this.usesNumber,
    this.numUsed,
    this.userType,
  });

  PromocodeData.fromJson(Map<String, dynamic> json) {
    promoCodeId = json["promocode_id"];
    promoCodeName = json["promocode_name"];
    promoCode = json["promo_code"];
    description = json["description"];
    thumbnailImage = json["thumbnail_image"];
    promoCodeType = json["promocode_type"];
    promoCodeDiscountValue = json["promocode_discount_value"];
    maxValue = json["max_value"];
    minCartValue = json["minimum_cart_value"];
    category = json["category"];
    product = json["product"];
    usesLimit = json["uses_limit"];
    usesNumber = json["uses_number"];
    validityStart = json["validity_start"];
    validityEnd = json["validity_end"];
    customerType = json["customer_type"];
    status = json["status"];
    promoCodeFor = json["promocode_for"];
    numUsed = json["num_used"];
    userType = json["user_type"];
    createdAt = json["created_at"];
    upDatedAt = json["updated_at"];
    createdBy = json["created_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["promocode_id"] = promoCodeId;
    data["promocode_name"] = promoCodeName;
    data["promo_code"] = promoCode;
    data["description"] = description;
    data["thumbnail_image"] = thumbnailImage;
    data["promocode_type"] = promoCodeType;
    data["promocode_discount_value"] = promoCodeDiscountValue;
    data["max_value"] = maxValue;
    data["minimum_cart_value"] = minCartValue;
    data["category"] = category;
    data["product"] = product;
    data["uses_limit"] = usesLimit;
    data["uses_number"] = usesNumber;
    data["validity_start"] = validityStart;
    data["validity_end"] = validityEnd;
    data["customer_type"] = customerType;
    data["status"] = status;
    data["promoCodeFor"] = promoCodeFor;
    data["num_used"] = numUsed;
    data["user_type"] = userType;
    data["createdAt"] = createdAt;
    data["upDatedAt"] = upDatedAt;
    data["created_by"] = createdBy;
    return data;
  }
}
