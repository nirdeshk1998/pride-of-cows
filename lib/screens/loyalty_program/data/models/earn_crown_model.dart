class EarnCrownReqModel {
  String? userId;

  EarnCrownReqModel({
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["userID"] = userId;
    return data;
  }
}

class EarnCrownResModel {
  int? status;
  int ? rewardPointBalance;
  List<RewardData>? reward;

  EarnCrownResModel({
    this.status,
    this.reward,
    this.rewardPointBalance,
  });

  EarnCrownResModel.fromJson(Map<String, dynamic>json){
    status = json["status"];
    rewardPointBalance = json["reward_points_balance"];
    if (json["reward"] != null) {
      reward = <RewardData>[];
      json["reward"].forEach((v) {
        reward!.add(RewardData.fromJson(v));
      });
    }
  }
}

class RewardData {
  int? rewardId;
  String? title;
  String? description;
  String? thumbnail;
  String? discountCode;
  String? rewardValue;
  String? noOfProduct;
  String? productSelection;
  String? validity;
  int? status;
  RewardData({
    this.status,
    this.title,
    this.description,
    this.thumbnail,
    this.rewardId,
    this.discountCode,
    this.noOfProduct,
    this.productSelection,
    this.rewardValue,
    this.validity,
});
  RewardData.fromJson(Map<String,dynamic>json){
    status=json["reward_id"];
    title=json["Title"];
    description=json["description"];
    thumbnail=json["thumbnail"];
    discountCode=json["reward_code"];
    rewardValue=json["reward_value"];
    noOfProduct=json["no_of_product"];
    productSelection=json["product_selection"];
    validity=json["validity"];
    status=json["status"];
  }
}
