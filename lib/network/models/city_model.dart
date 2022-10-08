class CityListResModel {
  int? status;
  String? message;
  List<CityListData>? data;

  CityListResModel({this.status, this.message, this.data});

  CityListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CityListData>[];
      json['data'].forEach((v) {
        data!.add(CityListData.fromJson(v));
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

class CityListData {
  String? cityId;
  String? cityName;

  CityListData({this.cityId, this.cityName});

  CityListData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    return data;
  }
}
