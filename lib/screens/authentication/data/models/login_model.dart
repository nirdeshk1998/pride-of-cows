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
  String? message;
  int? status;
  LoginData? data;
  Citydata? citydata;
  String? referralCode;

  LoginResModel({
    this.message,
    this.status,
    this.data,
    this.citydata,
    this.referralCode,
  });

  LoginResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    citydata = json['citydata'] != null ? Citydata.fromJson(json['citydata']) : null;
    referralCode = json['referal_code'];
  }


}

class LoginData {
  String? token;
  int? userID;
  String? mobileNo;
  String? email;
  String? firstName;
  String? middleName;
  String? lastName;
  String? city;
  String? cityId;
  String? flatPlotNo;
  String? buildingName;
  String? streetRoad;
  String? area;
  String? landmark;
  String? pincode;
  String? addressType;
  String? customerType;
  String? deliveryOption;
  String? gender;

  LoginData(
      {this.token,
      this.userID,
      this.gender,
      this.mobileNo,
      this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.city,
      this.cityId,
      this.flatPlotNo,
      this.buildingName,
      this.streetRoad,
      this.area,
      this.landmark,
      this.pincode,
      this.addressType,
      this.customerType,
      this.deliveryOption});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userID = json['UserID'];
    mobileNo = json['MobileNo'];
    email = json['Email'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    gender = json["gender"];
    city = json['City'];
    cityId = json['city_id'];
    flatPlotNo = json['flat_plot_no'];
    buildingName = json['building_name'];
    streetRoad = json['street_road'];
    area = json['area'];
    landmark = json['landmark'];
    pincode = json['pincode'];
    addressType = json['address_type'];
    customerType = json['customer_type'];
    deliveryOption = json['delivery_option'];
  }

}

class Citydata {
  String? city;
  String? cityName;
  int? isSubscribe;

  Citydata({this.city, this.cityName, this.isSubscribe});

  Citydata.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityName = json['cityName'];
    isSubscribe = json['is_subscribe'];
  }


}
