class StateListResModel {
  int? status;
  String? message;
  List<StateListData>? data;

  StateListResModel({this.status, this.message, this.data});

  StateListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StateListData>[];
      json['data'].forEach((v) {
        data!.add(StateListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateListData {
  int? stateId;
  String? stateName;

  StateListData({this.stateId, this.stateName});

  StateListData.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    return data;
  }
}
