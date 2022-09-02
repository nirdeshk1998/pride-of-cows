class ProfileUpdateReqModel{
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? dob;
  String ? mobileNo;
  String ? subsScribeNewsLetter;
  ProfileUpdateReqModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.dob,
    this.mobileNo,
    this.subsScribeNewsLetter,
  });
Map<String, dynamic> toJson(){
  final Map<String, dynamic> data = <String, dynamic>{};
  data['UserId'] = userId;
  data['firstname'] = firstName;
  data['lastname'] = lastName;
  data["mobileno"]=mobileNo;
  data['gender'] = gender;
  data['email'] = email;
  data["dob"]=dob;
  data["subscribe_newsletter"]=subsScribeNewsLetter;
  print(data);
  return data;
}
}
class ProfileUpdateResModel{
int ?status;
String? message;
ProfileUpdateResModel({
  this.status,
  this.message,
});
ProfileUpdateResModel.fromJson(Map<String, dynamic> json){
  print(json);
  status=json["status"];
  message=json["message"];
}
}
