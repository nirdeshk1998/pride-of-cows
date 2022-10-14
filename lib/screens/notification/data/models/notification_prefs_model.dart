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
