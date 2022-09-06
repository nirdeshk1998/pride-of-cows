import 'package:poc/utils/enums.dart';

class OfferReqModel{
int? userId;
OfferReqModel({
  this.userId,
});
Map<String,dynamic> toJson(){
  final Map<String,dynamic> data=<String,dynamic>{};
  data["userID"]=userId;
  print("userId${userId}");
return data;
}
}
class OfferResModel{
  int? status;
  String?message;
  List<OfferData>? data;
  OfferResModel({
   this.status,
   this.message,
    this.data,
});
  OfferResModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    message=json["message"];
    if(json["data"]!=null){
     json["data"].forEach((v){
       data?.add(OfferData.fromJson(v));
     });
    }
  }
}
class OfferData{
  int ?promoId;
  String? promoCodeName;
  String? promoCode;
  String? thumbImg;
  String? promoCodeType;
  String? validityEnd;
  String? validityStart;
  String? description;
  String? maxValue;
  String? minCartValue;
  String? promoCodeDiscountValue;
OfferData({
   this.promoId,
  this.promoCodeName,
  this.promoCode,
  this.thumbImg,
  this.promoCodeType,
  this.validityEnd,
  this.validityStart,
  this.description,
  this.maxValue,
  this.minCartValue,
  this.promoCodeDiscountValue,
});
  OfferData.fromJson(Map<String,dynamic>json){
    promoId=json["id"];
    promoCodeName=json["promocode_name"];
    promoCode=json["promo_code"];
    thumbImg=json["thumbnail_image"];
    promoCodeType=json["promocode_type"];
    validityEnd=json["validity_end"];
    validityStart=json["validity_start"];
    description=json["description"];
    maxValue=json["max_value"];
    minCartValue=json["minimum_cart_value"];
    promoCodeDiscountValue=json["promocode_discount_value"];
  }
}
class ApplyOfferReqModel{
int? userId;
int? promoCodeId;
ApplyOfferReqModel({
  this.userId,
  this.promoCodeId
});
Map<String,dynamic>toJson(){
  final Map<String,dynamic>data={};
  data["userID"]=userId;
  data["promocode_id"]=promoCodeId;
  return data;
}
}
class ApplyOfferResModel{
int ? status;
String ? message;
ApplyOfferResModel({
  this.status,
  this.message,
});
ApplyOfferResModel.fromJson(Map<String,dynamic>json){
  json["status"]=status;
  json["message"]=message;
}
}
