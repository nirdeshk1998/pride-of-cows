class OtpReqModel {
  String? mobileNo;
  String? otp;

  OtpReqModel({this.mobileNo, this.otp});

  OtpReqModel.fromJson(Map<String, dynamic> json) {
    mobileNo = json['MobileNo'];
    otp = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MobileNo'] = mobileNo;
    data['OTP'] = otp;
    return data;
  }

  Map<String, dynamic> toResendOtpJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MobileNo'] = mobileNo;
    return data;
  }
}

class OtpResModel {
  int? status;
  String? message;
  String? otp;
  String? data;
  int? isNew;

  OtpResModel({this.status, this.message, this.otp, this.data, this.isNew});

  OtpResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
    data = json['data'];
    isNew = json['is_new'];
  }

  OtpResModel.fromResendOtpJson(Map<String, dynamic> json) {
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
