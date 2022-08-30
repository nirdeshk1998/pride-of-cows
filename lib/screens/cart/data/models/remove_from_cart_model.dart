class RemoveFromCartReqModel {
  String? userId;
  int? cartId;

  RemoveFromCartReqModel({this.userId, this.cartId});

  RemoveFromCartReqModel.fromJson(Map<String, dynamic> json) {
    userId = json['userID'];
    cartId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['cart_id'] = cartId;
    return data;
  }
}
