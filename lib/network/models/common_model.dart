class CommonResModel {
  dynamic data;
  int? status;
  String? message;

  CommonResModel({this.data, this.status, this.message});

  CommonResModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
