class AddressBookResModel {
  int? status;
  String? message;
  List<AddressBookData>? data;
  int? totaladdress;

  AddressBookResModel({this.status, this.message, this.data, this.totaladdress});

  AddressBookResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddressBookData>[];
      json['data'].forEach((v) {
        data!.add(AddressBookData.fromJson(v));
      });
    }
    totaladdress = json['totaladdress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totaladdress'] = totaladdress;
    return data;
  }
}

class AddressBookData {
  String? id;
  String? name;
  String? address1;
  String? address2;
  String? address3;
  String? addressType;
  String? pincode;
  String? state;
  String? city;
  String? lat;
  String? long;
  String? mobileNo;
  String? alternativeNo;
  String? createdAt;
  String? updatedAt;
  String? selectType;
  String? defaultAddress;
  String? othername;
  String? stateName;
  String? cityName;

  AddressBookData(
      {this.id,
      this.name,
      this.address1,
      this.address2,
      this.address3,
      this.addressType,
      this.pincode,
      this.state,
      this.city,
      this.lat,
      this.long,
      this.mobileNo,
      this.alternativeNo,
      this.createdAt,
      this.updatedAt,
      this.selectType,
      this.defaultAddress,
      this.othername,
      this.stateName,
      this.cityName});

  AddressBookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    addressType = json['addressType'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    mobileNo = json['mobileNo'];
    alternativeNo = json['alternativeNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    selectType = json['selectType'];
    defaultAddress = json['default_address'];
    othername = json['othername'];
    stateName = json['state_name'];
    cityName = json['cityname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['addressType'] = addressType;
    data['pincode'] = pincode;
    data['state'] = state;
    data['city'] = city;
    data['lat'] = lat;
    data['long'] = long;
    data['mobileNo'] = mobileNo;
    data['alternativeNo'] = alternativeNo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['selectType'] = selectType;
    data['default_address'] = defaultAddress;
    data['othername'] = othername;
    data['state_name'] = stateName;
    data['cityname'] = cityName;
    return data;
  }
}
