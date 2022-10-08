class UserRegisterReqModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? address1;
  String? address2;
  String? landmark;
  String? pincode;
  String? state;
  String? city;
  String? referedCode;

  UserRegisterReqModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.address1,
    this.address2,
    this.landmark,
    this.pincode,
    this.state,
    this.city,
    this.referedCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['gender'] = gender;
    data['address1'] = address1;
    data['address2'] = address2;
    data['Landmark'] = landmark;
    data['pincode'] = pincode;
    data['State'] = state;
    data['City'] = city;
    data['refered_code'] = referedCode;
    return data;
  }
}
