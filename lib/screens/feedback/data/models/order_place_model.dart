class OrderPlaceReqModel {
  int? userId;
  String? orderType;
  int? checkOutAddress;
  String? paymentMethod;
  String? wallet;

  OrderPlaceReqModel({
    this.userId,
    this.paymentMethod,
    this.checkOutAddress,
    this.orderType,
    this.wallet,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["userID"] = userId;
    data["orderType"] = orderType;
    data["checkout_address"] = checkOutAddress;
    data["payment_method"] = paymentMethod;
    data["wallet"] = wallet;
    return data;
  }
}

class OrderPlaceResModel {
  int? status;
  String? message;
  String? orderId;

  OrderPlaceResModel({
    this.status,
    this.message,
    this.orderId,
  });

  OrderPlaceResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderId = json["orderId"];
  }
}
