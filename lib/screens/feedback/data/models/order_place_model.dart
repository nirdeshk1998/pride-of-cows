class OrderPlaceReqModel {
  String? userId;
  String? orderType;
  String? paymentMethod;
  String? wallet;

  OrderPlaceReqModel({
    this.userId,
    this.paymentMethod,
    this.orderType,
    this.wallet,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["userID"] = userId;
    data["orderType"] = orderType;
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
