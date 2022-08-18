class CategoryResModel{
  int ? status;
  String ? message;
  List ? data;
  CategoryResModel({
    this.status,
    this.message,
    this.data,
});
  CategoryResModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
    data=json["data"];
  }
}