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
