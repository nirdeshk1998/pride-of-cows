class RateOrderReqModel {
  String? userID;
  int? orderId;
  int? rate, delRate;
  LikedServicesReqModel? likedServices;
  String? message;

  RateOrderReqModel({
    this.userID,
    this.orderId,
    this.rate,
    this.likedServices,
    this.message,
    this.delRate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['order_id'] = orderId;
    data['rate'] = rate;
    data['delivery_rate'] = delRate;
    if (likedServices != null) data['liked_services'] = likedServices!.toJson();
    data['message'] = message;
    return data;
  }
}

class LikedServicesReqModel {
  int? i0;
  int? i1;
  int? i2;
  int? i3;

  LikedServicesReqModel({this.i0, this.i1, this.i2, this.i3});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = i0;
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    return data;
  }
}
