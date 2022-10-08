class AllNotificationReqModel{
  String? fcmToken;
  int? userId;
  AllNotificationReqModel({
    this.fcmToken,
    this.userId,
});
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data={};
    data["fcmtoken"]=fcmToken;
    data["userID"]=userId;
    return data;
  }

}

class AllNotificationResModel{
  int? status;
  String? message;
  AllNotificationResModel({
    this.status,
    this.message,
});
  AllNotificationResModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
  }
}
