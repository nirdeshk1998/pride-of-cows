class SubmitQueryReqModel{
  String? name;
  String? mobile;
  String? email;
  String? location;
  SubmitQueryReqModel({
    this.name,
    this.email,
    this.location,
    this.mobile,
});
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data={};
    data["name"]=name;
    data["mobile"]=mobile;
    data["email"]=email;
    data["location"]=location;
    data["mobile"]=mobile;
    return data;
  }
}

class SubmitQueryResModel{
  int? status;
  String ? message;
  SubmitQueryResModel({
    this.status,
    this.message,
});
  SubmitQueryResModel.fromjson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
  }
}
class ContactDetailsResModel{
  int? status;
  List<ContactUsData>? data;
  ContactDetailsResModel({
    this.status,
    this.data,
});
  ContactDetailsResModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    if (json["address"] != null) {
      data = <ContactUsData>[];
      json['address'].forEach((v) {
        data!.add(ContactUsData.fromJson(v));
      });
    }
  }
}
class ContactUsData{
  int? id;
  String? optionKey;
  String? optionValue;
  ContactUsData({
    this.id,
    this.optionKey,
    this.optionValue,
});
  ContactUsData.fromJson(Map<String,dynamic>json){
    id=json["id"];
    optionKey=json["option_key"];
    optionValue=json["option_value"];
  }
}



