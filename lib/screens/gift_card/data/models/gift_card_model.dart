import 'package:poc/utils/enums.dart';

class AddGiftReqModel{
  String ? giftCardType;
  String ? giftAmount;
  String ? recipeintName;
  String ? recipeintPhone;
  String ? recipeintEmail;
  String ? recipeintPinCode;
  String ? recipeintCountryCode;
  String ? sendersName;
  String ? sendersEmail;
  String ? sendersMessage;
  int ? userId;
  AddGiftReqModel({
    this.giftCardType,
    this.giftAmount,
    this.recipeintName,
    this.recipeintPhone,
    this.recipeintEmail,
    this.recipeintPinCode,
    this.recipeintCountryCode,
    this.sendersName,
    this.sendersEmail,
    this.sendersMessage,
    this.userId,
});
  Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data["giftcard_type"]=giftCardType;
    data["gift_amount"]=giftAmount;
    data["Recipient_Name"]=recipeintName;
    data["Recipient_Phone"]=recipeintPhone;
    data["Recipient_Email"]=recipeintEmail;
    data["Recipient_Pincode"]=recipeintPinCode;
    data["Recipient_Countrycode"]=recipeintCountryCode;
    data["Senders_Name"]=sendersName;
    data["Senders_Email"]=sendersEmail;
    data["Senders_Message"]=sendersMessage;
    data["UserID"]=userId;
    return data;
}

}

class AddGiftResModel{
  int ? status;
  String ?message;
  AddGiftResModel({
   this.status,
    this.message,
});
  AddGiftResModel.fromJson(Map<String,dynamic>json){
    print(json);
    status=json["status"];
    message=json["message"];
    
}
}
