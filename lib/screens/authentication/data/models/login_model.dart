class LoginReqModel {
  String? mobileNo;
  String? fCMToken;
  String? type;
  String? deviceOs;
  String? platform;
  String? devicename;
  String? deviceOsVersion;

  LoginReqModel({
    this.mobileNo,
    this.fCMToken,
    this.type,
    this.deviceOs,
    this.platform,
    this.devicename,
    this.deviceOsVersion,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MobileNo'] = mobileNo;
    data['FCMToken'] = fCMToken;
    data['Type'] = type;
    data['DeviceType'] = deviceOs;
    data['Platform'] = platform;
    data['DeviceName'] = devicename;
    data['OsVersion'] = devicename;
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

  LoginResModel.fromResendOtpJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
    data = json['data'];
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
