class AddCartReqModel {
  String? userID;
  String? productId;
  String? deliveryPlan;
  String? startDate;
  String? endDate;
  String? quantity;
  String? cityId;
  CustomDays? customDays;

  AddCartReqModel({
    this.userID,
    this.productId,
    this.deliveryPlan,
    this.startDate,
    this.endDate,
    this.quantity,
    this.cityId,
    this.customDays,
  });

  AddCartReqModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    productId = json['product_id'];
    deliveryPlan = json['deliveryPlan'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    quantity = json['quantity'];
    cityId = json['city_id'];
    customDays = json['customDays'] != null ? CustomDays.fromJson(json['customDays']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['product_id'] = productId;
    data['deliveryPlan'] = deliveryPlan;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['city_id'] = cityId;
    data['quantity'] = quantity;
    if (customDays != null) {
      data['customDays'] = customDays!.toJson();
    }
    return data;
  }
}

class CustomDays {
  int? empty;
  int? mon;
  int? tue;
  int? wed;
  int? thur;
  int? fri;
  int? sat;
  int? sun;

  CustomDays({
    this.empty,
    this.mon,
    this.tue,
    this.wed,
    this.thur,
    this.fri,
    this.sat,
    this.sun,
  });

  CustomDays.fromJson(Map<String, dynamic> json) {
    empty = json['0'];
    mon = json['1'];
    tue = json['2'];
    wed = json['3'];
    thur = json['4'];
    fri = json['5'];
    sat = json['6'];
    sun = json['7'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = empty;
    data['1'] = mon;
    data['2'] = tue;
    data['3'] = wed;
    data['4'] = thur;
    data['5'] = fri;
    data['6'] = sat;
    data['7'] = sun;
    return data;
  }
}
