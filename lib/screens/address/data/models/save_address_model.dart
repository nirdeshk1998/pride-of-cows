class CreateUpdateAddressReqModel {
  String? addressId;
  String? name;
  String? address;
  String? locality;
  String? landmark;
  int? pincode;
  int? state;
  int? city;
  String? addressType;
  int? mobileNo;
  int? alternativeNo;
  String? defaultAddress;
  String? othername;

  CreateUpdateAddressReqModel({
    this.addressId,
    this.name,
    this.address,
    this.locality,
    this.landmark,
    this.pincode,
    this.state,
    this.city,
    this.addressType,
    this.mobileNo,
    this.alternativeNo,
    this.defaultAddress,
    this.othername,
  });

  CreateUpdateAddressReqModel.fromJson(Map<String, dynamic> json) {
    addressId = json['addressid'];
    name = json['name'];
    address = json['address1'];
    locality = json['address2'];
    landmark = json['address3'];
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
    data['addressid'] = addressId;
    data['name'] = name;
    data['address1'] = address;
    data['address2'] = locality;
    data['address3'] = landmark;
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
