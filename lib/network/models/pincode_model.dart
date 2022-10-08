class PincodeResModel {
  int? status;
  String? message;
  PincodeData? data;

  PincodeResModel({this.status, this.message, this.data});

  PincodeResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PincodeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PincodeData {
  String? id;
  String? cityId;
  String? depoId;
  String? routeId;
  String? areaId;
  String? postalcode;
  String? status;
  String? isdeleted;
  String? stateId;
  String? stateName;
  String? cityName;

  PincodeData(
      {this.id,
      this.cityId,
      this.depoId,
      this.routeId,
      this.areaId,
      this.postalcode,
      this.status,
      this.isdeleted,
      this.stateId,
      this.stateName,
      this.cityName});

  PincodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    depoId = json['depo_id'];
    routeId = json['route_id'];
    areaId = json['area_id'];
    postalcode = json['postalcode'];
    status = json['status'];
    isdeleted = json['isdeleted'];
    stateId = json['sid'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_id'] = cityId;
    data['depo_id'] = depoId;
    data['route_id'] = routeId;
    data['area_id'] = areaId;
    data['postalcode'] = postalcode;
    data['status'] = status;
    data['isdeleted'] = isdeleted;
    data['sid'] = stateId;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    return data;
  }
}
