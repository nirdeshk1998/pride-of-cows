class LoginReqModel {
  int? mobileNo;
  String? fCMToken;
  String? type;
  String? devicetype;
  String? platform;
  String? devicename;

  LoginReqModel({
    this.mobileNo,
    this.fCMToken,
    this.type,
    this.devicetype,
    this.platform,
    this.devicename,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MobileNo'] = mobileNo;
    data['FCMToken'] = fCMToken;
    data['Type'] = type;
    data['devicetype'] = devicetype;
    data['platform'] = platform;
    data['devicename'] = devicename;
    return data;
  }
}

class LoginResModel {
  int? status;
  String? message;
  int? otp;
  int? data;
  int? isNew;

  LoginResModel({this.status, this.message, this.otp, this.data, this.isNew});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
    data = json['data'];
    isNew = json['is_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['otp'] = otp;
    data['data'] = this.data;
    data['is_new'] = isNew;
    return data;
  }
}
