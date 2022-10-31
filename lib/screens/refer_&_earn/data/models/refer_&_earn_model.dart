import 'package:intl/intl.dart';

class ReferalHistoryReqModel {
  String? userId;

  ReferalHistoryReqModel({
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userID"] = userId;
    return data;
  }
}

class ReferalHistoryResModel {
  int? status;
  List<ReferalHistoryData>? data;

  ReferalHistoryResModel({
    this.status,
    this.data,
  });

  ReferalHistoryResModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json["refferalhistory"] != null) {
      data = <ReferalHistoryData>[];
      json["refferalhistory"].forEach((v){
        data?.add(ReferalHistoryData.fromJson(v));
      });
    }
  }
}

class ReferalHistoryData {
  int? id;
  String? customerId;
  int? inviteCode;
  String? invitedEmail;
  String? invitedName;
  String? pocOrderId;
  String? invitedStatus;
  String? purchaseStatus;
  String? invitedDate;
  String? redeemStatus;
  String? joinedDate;
  String? invitedCustomerId;
  int? redeemIdRefError;
  int? redeemIdRefer;

  ReferalHistoryData(
      {this.id,
      this.customerId,
      this.inviteCode,
      this.invitedCustomerId,
      this.invitedDate,
      this.invitedEmail,
      this.invitedName,
      this.invitedStatus,
      this.joinedDate,
      this.pocOrderId,
      this.purchaseStatus,
      this.redeemIdRefer,
      this.redeemIdRefError,
      this.redeemStatus});
  ReferalHistoryData.fromJson(Map<String,dynamic>json){
    id=json["id"];
    customerId=json["customer_id"];
    inviteCode=json["invitecode"];
    invitedEmail=json["invitedEmail"];
    invitedName=json["invitedName"];
    pocOrderId=json["poc_order_id"];
    invitedStatus=json["invitedStatus"];
    purchaseStatus=json["purchaseStatus"];
    invitedDate=json["invitedDate"];
    redeemStatus=json["redeemStatus"];
    joinedDate=json["joinedDate"];
    invitedCustomerId=json["invited_customer_id"];
    redeemIdRefError=json["redeem_id_referror"];
    redeemIdRefer=json["redeem_id_refer"];
  }
}
