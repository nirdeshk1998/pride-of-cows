class AvailablePincodeResModel {
  int? status;
  String? message;
  List<AvailablePincodeData>? data;

  AvailablePincodeResModel({this.status, this.message, this.data});

  AvailablePincodeResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AvailablePincodeData>[];
      json['data'].forEach((v) {
        data!.add(AvailablePincodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailablePincodeData {
  String? id;
  String? pincode;
  String? stateName;
  String? cityName;

  AvailablePincodeData({this.id, this.pincode});

  AvailablePincodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pincode = json['pincode'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pincode'] = pincode;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    return data;
  }
}
