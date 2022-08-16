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
    print("data${data}");
    return data;
  }
}

class LoginResModel {
  String? message;
  int? status;
  LoginData? data;
  Citydata? citydata;

  LoginResModel({this.message, this.status, this.data, this.citydata});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    citydata = json['citydata'] != null ? Citydata.fromJson(json['citydata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (citydata != null) {
      data['citydata'] = citydata!.toJson();
    }
    return data;
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

  LoginData(
      {this.token,
      this.userID,
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['UserID'] = userID;
    data['MobileNo'] = mobileNo;
    data['Email'] = email;
    data['FirstName'] = firstName;
    data['MiddleName'] = middleName;
    data['LastName'] = lastName;
    data['City'] = city;
    data['city_id'] = cityId;
    data['flat_plot_no'] = flatPlotNo;
    data['building_name'] = buildingName;
    data['street_road'] = streetRoad;
    data['area'] = area;
    data['landmark'] = landmark;
    data['pincode'] = pincode;
    data['address_type'] = addressType;
    data['customer_type'] = customerType;
    data['delivery_option'] = deliveryOption;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['cityName'] = cityName;
    data['is_subscribe'] = isSubscribe;
    return data;
  }
}
