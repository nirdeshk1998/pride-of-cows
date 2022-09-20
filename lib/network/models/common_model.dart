class CommonResModel {
  int? status;
  String? message;
  dynamic data;

  CommonResModel({this.data, this.status, this.message});

  CommonResModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class CommonRessModel<T> {
  int? status;
  String? message;
  T? data;

  CommonRessModel({this.data, this.status, this.message});

  CommonRessModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }
}

class CommonReqModel {
  String? userId;
  String? orderId;
  int? page;
  int? limit;

  CommonReqModel({
    this.page,
    this.limit,
    this.userId,
    this.orderId,
  });

  Map<String, dynamic> toGetOrderJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }

  Map<String, dynamic> toGetOrderDetailsJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['orderid'] = orderId;
    return data;
  }
}
