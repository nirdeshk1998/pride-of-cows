class NotificationPrefsReqModel {
  int? enableAll;
  int? orderAndPurchase;
  int? promosAndOffer;
  String? userID;

  NotificationPrefsReqModel(
      {this.enableAll,
      this.orderAndPurchase,
      this.promosAndOffer,
      this.userID});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enable_all'] = enableAll;
    data['order_and_purchase'] = orderAndPurchase;
    data['promos_and_offer'] = promosAndOffer;
    data['userID'] = userID;
    return data;
  }
}

class NotificationPrefsResModel {
  int? status;
  String? message;
  NotificationPrefsData? data;

  NotificationPrefsResModel({this.status, this.message, this.data});

  NotificationPrefsResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? NotificationPrefsData.fromJson(json['data']) : null;
  }

}

class NotificationPrefsData {
  int? id;
  int? enableAll;
  int? orderAndPurchase;
  int? promosAndOffer;
  int? status;
  int? userID;
  String? craetedAt;
  String? updatedAt;

  NotificationPrefsData(
      {this.id,
      this.enableAll,
      this.orderAndPurchase,
      this.promosAndOffer,
      this.status,
      this.userID,
      this.craetedAt,
      this.updatedAt});

  NotificationPrefsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enableAll = json['enable_all'];
    orderAndPurchase = json['order_and_purchase'];
    promosAndOffer = json['promos_and_offer'];
    status = json['status'];
    userID = json['userID'];
    craetedAt = json['craeted_at'];
    updatedAt = json['updated_at'];
  }

}

