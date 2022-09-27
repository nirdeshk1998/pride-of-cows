class RatingServiceResModel {
  int? status;
  List<RatingServices>? ratingServices;

  RatingServiceResModel({this.status, this.ratingServices});

  RatingServiceResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['rating_services'] != null) {
      ratingServices = <RatingServices>[];
      json['rating_services'].forEach((v) {
        ratingServices!.add(RatingServices.fromJson(v));
      });
    }
  }
}

class RatingServices {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  RatingServices({this.id, this.name, this.createdAt, this.updatedAt});

  RatingServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
