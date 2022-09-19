import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';

class HomeResModel {
  int? status;
  String? message;
  List<PincodeDataList>? pincodeDataList;
  List<HeaderAddressData>? headerAddressData;
  List<DealsOfferData>? dealsOfferData;
  CategoryListResModel? categoryListResModel;
  EarnedCrownResModel? earnedCrownResModel;
  ReferEarnResModel? referEarnResModel;
  List<ProductData>? topPicksData;
  OrderAgainResModel? orderAgainResModel;
  AboutVideoResModel? aboutVideoResModel;
  dynamic featuredData;

  HomeResModel(
      {this.status,
      this.message,
      this.pincodeDataList,
      this.headerAddressData,
      this.dealsOfferData,
      this.categoryListResModel,
      this.earnedCrownResModel,
      this.referEarnResModel,
      this.topPicksData,
      this.orderAgainResModel,
      this.aboutVideoResModel,
      this.featuredData});

  HomeResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['pincodeontop'] != null) {
      pincodeDataList = <PincodeDataList>[];
      json['pincodeontop'].forEach((v) {
        pincodeDataList!.add(PincodeDataList.fromJson(v));
      });
    }
    if (json['headeraddressdata'] != null) {
      headerAddressData = <HeaderAddressData>[];
      json['headeraddressdata'].forEach((v) {
        headerAddressData!.add(HeaderAddressData.fromJson(v));
      });
    }
    if (json['discountofferdata'] != null) {
      dealsOfferData = <DealsOfferData>[];
      json['discountofferdata'].forEach((v) {
        dealsOfferData!.add(DealsOfferData.fromJson(v));
      });
    }
    categoryListResModel = json['categorylistdata'] != null ? CategoryListResModel.fromJson(json['categorylistdata']) : null;
    earnedCrownResModel = json['Earnedcrown'] != null ? EarnedCrownResModel.fromJson(json['Earnedcrown']) : null;
    referEarnResModel = json['Refercodedata'] != null ? ReferEarnResModel.fromJson(json['Refercodedata']) : null;
    if (json['Toppickupsdata'] != null) {
      topPicksData = <ProductData>[];
      json['Toppickupsdata'].forEach((v) {
        topPicksData!.add(ProductData.fromJson(v));
      });
    }
    orderAgainResModel = json['orderagaindata'] != null ? OrderAgainResModel.fromJson(json['orderagaindata']) : null;
    aboutVideoResModel = json['Aboutvideos'] != null ? AboutVideoResModel.fromJson(json['Aboutvideos']) : null;
    featuredData = json['Pocfeaturedata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (pincodeDataList != null) {
      data['pincodeontop'] = pincodeDataList!.map((v) => v.toJson()).toList();
    }
    if (headerAddressData != null) {
      data['headeraddressdata'] = headerAddressData!.map((v) => v.toJson()).toList();
    }
    if (dealsOfferData != null) {
      data['discountofferdata'] = dealsOfferData!.map((v) => v.toJson()).toList();
    }
    if (categoryListResModel != null) {
      data['categorylistdata'] = categoryListResModel!.toJson();
    }
    if (earnedCrownResModel != null) {
      data['Earnedcrown'] = earnedCrownResModel!.toJson();
    }
    if (referEarnResModel != null) {
      data['Refercodedata'] = referEarnResModel!.toJson();
    }
    if (topPicksData != null) {
      data['Toppickupsdata'] = topPicksData!.map((v) => v.toJson()).toList();
    }
    if (orderAgainResModel != null) {
      data['orderagaindata'] = orderAgainResModel!.toJson();
    }
    if (aboutVideoResModel != null) {
      data['Aboutvideos'] = aboutVideoResModel!.toJson();
    }
    data['Pocfeaturedata'] = featuredData;
    return data;
  }
}

class PincodeDataList {
  String? id;
  String? pincode;

  PincodeDataList({this.id, this.pincode});

  PincodeDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pincode'] = pincode;
    return data;
  }
}

class HeaderAddressData {
  String? id;
  String? name;
  String? address1;
  String? address2;
  String? address3;
  String? addressType;
  String? pincode;
  String? state;
  String? city;
  String? lat;
  String? long;
  String? mobileNo;
  String? alternativeNo;
  String? createdAt;
  String? updatedAt;
  String? selectType;
  String? defaultAddress;
  String? othername;
  String? stateName;
  String? cityname;

  HeaderAddressData(
      {this.id,
      this.name,
      this.address1,
      this.address2,
      this.address3,
      this.addressType,
      this.pincode,
      this.state,
      this.city,
      this.lat,
      this.long,
      this.mobileNo,
      this.alternativeNo,
      this.createdAt,
      this.updatedAt,
      this.selectType,
      this.defaultAddress,
      this.othername,
      this.stateName,
      this.cityname});

  HeaderAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    addressType = json['addressType'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    mobileNo = json['mobileNo'];
    alternativeNo = json['alternativeNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    selectType = json['selectType'];
    defaultAddress = json['default_address'];
    othername = json['othername'];
    stateName = json['state_name'];
    cityname = json['cityname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['addressType'] = addressType;
    data['pincode'] = pincode;
    data['state'] = state;
    data['city'] = city;
    data['lat'] = lat;
    data['long'] = long;
    data['mobileNo'] = mobileNo;
    data['alternativeNo'] = alternativeNo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['selectType'] = selectType;
    data['default_address'] = defaultAddress;
    data['othername'] = othername;
    data['state_name'] = stateName;
    data['cityname'] = cityname;
    return data;
  }
}

class DealsOfferData {
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

  DealsOfferData(
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

  DealsOfferData.fromJson(Map<String, dynamic> json) {
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

class EarnedCrownResModel {
  int? status;
  int? rewardPointsBalance;
  List<Reward>? reward;

  EarnedCrownResModel({this.status, this.rewardPointsBalance, this.reward});

  EarnedCrownResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    rewardPointsBalance = json['reward_points_balance'];
    if (json['reward'] != null) {
      reward = <Reward>[];
      json['reward'].forEach((v) {
        reward!.add(Reward.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['reward_points_balance'] = rewardPointsBalance;
    if (reward != null) {
      data['reward'] = reward!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reward {
  int? rewardId;
  String? title;
  String? description;
  String? thumbnail;
  String? rewardCode;
  String? rewardValue;
  int? noOfProduct;
  String? productSelection;
  String? validity;
  int? status;

  Reward(
      {this.rewardId,
      this.title,
      this.description,
      this.thumbnail,
      this.rewardCode,
      this.rewardValue,
      this.noOfProduct,
      this.productSelection,
      this.validity,
      this.status});

  Reward.fromJson(Map<String, dynamic> json) {
    rewardId = json['reward_id'];
    title = json['Title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    rewardCode = json['reward_code'];
    rewardValue = json['reward_value'];
    noOfProduct = json['no_of_product'];
    productSelection = json['product_selection'];
    validity = json['validity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reward_id'] = rewardId;
    data['Title'] = title;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['reward_code'] = rewardCode;
    data['reward_value'] = rewardValue;
    data['no_of_product'] = noOfProduct;
    data['product_selection'] = productSelection;
    data['validity'] = validity;
    data['status'] = status;
    return data;
  }
}

class ReferEarnResModel {
  int? status;
  String? message;
  String? data;

  ReferEarnResModel({this.status, this.message, this.data});

  ReferEarnResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}

class OrderAgainResModel {
  int? status;
  String? message;

  OrderAgainResModel({this.status, this.message});

  OrderAgainResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class AboutVideoResModel {
  int? status;
  String? message;
  AboutVideoData? data;

  AboutVideoResModel({this.status, this.message, this.data});

  AboutVideoResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AboutVideoData.fromJson(json['data']) : null;
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

class AboutVideoData {
  String? videolink;

  AboutVideoData({this.videolink});

  AboutVideoData.fromJson(Map<String, dynamic> json) {
    videolink = json['Videolink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Videolink'] = videolink;
    return data;
  }
}
