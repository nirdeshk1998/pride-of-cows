class UpdateAddressResModel {
  int? addressid;
  String? name;
  String? address1;
  String? address2;
  String? address3;
  int? pincode;
  int? state;
  int? city;
  String? addressType;
  int? mobileNo;
  int? alternativeNo;
  String? defaultAddress;
  String? othername;

  UpdateAddressResModel({
    this.addressid,
    this.name,
    this.address1,
    this.address2,
    this.address3,
    this.pincode,
    this.state,
    this.city,
    this.addressType,
    this.mobileNo,
    this.alternativeNo,
    this.defaultAddress,
    this.othername,
  });

  UpdateAddressResModel.fromJson(Map<String, dynamic> json) {
    addressid = json['addressid'];
    name = json['name'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    addressType = json['addressType'];
    mobileNo = json['mobileNo'];
    alternativeNo = json['alternativeNo'];
    defaultAddress = json['default_address'];
    othername = json['othername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressid'] = addressid;
    data['name'] = name;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['pincode'] = pincode;
    data['state'] = state;
    data['city'] = city;
    data['addressType'] = addressType;
    data['mobileNo'] = mobileNo;
    data['alternativeNo'] = alternativeNo;
    data['default_address'] = defaultAddress;
    data['othername'] = othername;
    return data;
  }
}
