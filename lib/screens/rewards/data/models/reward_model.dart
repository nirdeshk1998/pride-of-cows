import 'package:intl/intl.dart';

class RewardsReqModel{
  String? userId;
  int? perPage;
  int?page;
  RewardsReqModel({
    this.userId,
    this.page,
    this.perPage,
});
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=<String,dynamic>{};
    data["userID"]=userId;
    data["per_page"]=perPage;
    data["page"]=page;
    return data;
}
}

class RewardsResModel{
  int? status;
  int? rewardPointBalance;
  List<RewardData>? rewards;
  List<RedeemedRewardsData>? redeemedRewards;
  int? noOfPages;
  RewardsResModel({
    this.status,
    this.rewardPointBalance,
    this.redeemedRewards,
    this.rewards,
    this.noOfPages,
});
  RewardsResModel.fromJson(Map<String,dynamic>json){
    status=json["status"];
    rewardPointBalance=json["reward_points_balance"];
     if(json["rewards"]!=null){
       rewards=<RewardData>[] ;
       json["rewards"].forEach((v){
         rewards?.add(RewardData.fromJson(v));
       });
     }
    if(json["redeemed_rewards"]!=null){
      redeemedRewards=<RedeemedRewardsData>[] ;
      json["redeemed_rewards"].forEach((v){
        redeemedRewards?.add(RedeemedRewardsData.fromJson(v));
      });
    }
    noOfPages=json["no_pages"];
  }
}

class RewardData{
  String? rewardId;
  String?title;
  String? description;
  String? thumbnail;
  String? rewardCode;
  String? rewardValue;
  String? noOfProduct;
  String? productSelection;
  String? validity;
  String? status;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? type;
  String? deletedAt;
  String? id;
  String? custId;
  String? validTill;
  String? referenceNo;
  String? isRedeem;
  String? isDisable;
  String? createdAt;
  String? updatedAt;
  String? referId;
  RewardData({
    this.id,
    this.status,
    this.description,
    this.title,
    this.validity,
    this.rewardValue,
    this.productSelection,this.noOfProduct,
    this.rewardId,this.createdBy,this.createdAt,
    this.createdDate,this.custId,
    this.deletedAt,
    this.isDisable,
    this.isRedeem,
    this.modifiedBy,
    this.modifiedDate,
    this.referenceNo,
    this.referId,
    this.rewardCode,
    this.thumbnail,
    this.type,
    this.updatedAt,
    this.validTill,
});
  RewardData.fromJson(Map<String,dynamic>json){
    rewardId=json["reward_id"];
    title=json["Title"];
    description=json["description"];
    thumbnail=json["thumbnail"];
    rewardCode=json["reward_code"];
    rewardValue=json["reward_value"];
    noOfProduct=json["no_of_product"];
    productSelection=json["product_selection"];
    validity=json["validity"];
    status=json["status"];
    createdBy=json["created_by"];
    createdDate=json["created_date"];
    modifiedBy=json["modified_by"];
    modifiedDate=json["modified_date"];
    type=json["type"];
    deletedAt=json["deleted_at"];
    id=json["id"];
    custId=json["cust_id"];
    validTill=json["valid_till"];
    referenceNo=json["reference_no"];
    isRedeem=json["is_redeem"];
    isDisable=json["is_disable"];
    createdAt=json["created_at"];
    updatedAt=json["updated_at"];
    referId=json["refer_id"];
  }
}

class RedeemedRewardsData{
  String? rewardId;
  String?title;
  String? description;
  String? thumbnail;
  String? rewardCode;
  String? rewardValue;
  String? noOfProduct;
  String? productSelection;
  String? validity;
  String? status;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? type;
  String? deletedAt;
  String? id;
  String? custId;
  String? validTill;
  String? referenceNo;
  String? isRedeem;
  String? isDisable;
  String? createdAt;
  String? updatedAt;
  String? referId;
  RedeemedRewardsData({
    this.id,
    this.status,
    this.description,
    this.title,
    this.validity,
    this.rewardValue,
    this.productSelection,
    this.noOfProduct,
    this.rewardId,
    this.createdBy,
    this.createdAt,
    this.createdDate,
    this.custId,
    this.deletedAt,
    this.isDisable,
    this.isRedeem,
    this.modifiedBy,
    this.modifiedDate,
    this.referenceNo,
    this.referId,
    this.rewardCode,
    this.thumbnail,
    this.type,
    this.updatedAt,
    this.validTill,
  });
  RedeemedRewardsData.fromJson(Map<String,dynamic>json){
    rewardId=json["reward_id"];
    title=json["Title"];
    description=json["description"];
    thumbnail=json["thumbnail"];
    rewardCode=json["reward_code"];
    rewardValue=json["reward_value"];
    noOfProduct=json["no_of_product"];
    productSelection=json["product_selection"];
    validity=json["validity"];
    status=json["status"];
    createdBy=json["created_by"];
    createdDate=json["created_date"];
    modifiedBy=json["modified_by"];
    modifiedDate=json["modified_date"];
    type=json["type"];
    deletedAt=json["deleted_at"];
    id=json["id"];
    custId=json["cust_id"];
    validTill=json["valid_till"];
    referenceNo=json["reference_no"];
    isRedeem=json["is_redeem"];
    isDisable=json["is_disable"];
    createdAt=json["created_at"];
    updatedAt=json["updated_at"];
    referId=json["refer_id"];
  }
}

