import 'package:poc/utils/enums.dart';

class OfferReqModel{
int? userId;
OfferReqModel({
  this.userId,
});
Map<String,dynamic> toJson(){
  final Map<String,dynamic> data=<String,dynamic>{};
  data["userId"]=userId;
return data;
}
}
class OfferResModel{
  int? status;
  String?message;
  List? data;
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
       // data?.add(OfferData.fromJson(v));
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
}
