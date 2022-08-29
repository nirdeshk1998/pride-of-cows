class AddCartReqModel {
  String? userID;
  String? productId;
  String? deliveryPlan;
  String? startDate;
  String? endDate;
  String? quantity;

  AddCartReqModel({this.userID, this.productId, this.deliveryPlan, this.startDate, this.endDate, this.quantity});

  AddCartReqModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    productId = json['product_id'];
    deliveryPlan = json['deliveryPlan'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['product_id'] = productId;
    data['deliveryPlan'] = deliveryPlan;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['quantity'] = quantity;
    return data;
  }
}
