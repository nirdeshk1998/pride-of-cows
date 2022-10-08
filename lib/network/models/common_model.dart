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
}

// class CommonRessModel<T> {
//   int? status;
//   String? message;
//   T? data;

//   CommonRessModel({this.data, this.status, this.message});

//   CommonRessModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'];
//     status = json['status'];
//     message = json['message'];
//   }
// }

class CommonReqModel {
  String? userId;
  String? orderId;
  int? page;
  int? limit;
  int? perPage;

  CommonReqModel({
    this.page,
    this.limit,
    this.userId,
    this.orderId,
    this.perPage,
  });

  Map<String, dynamic> toWalletBalanceJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['page'] = page;
    data['per_page'] = perPage;
    return data;
  }

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
