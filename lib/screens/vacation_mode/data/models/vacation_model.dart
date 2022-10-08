class VacationReqModel {
  String? userID;
  String? vacationStart;
  String? vacationEnd;
  String? remark;

  VacationReqModel({this.userID, this.vacationStart, this.vacationEnd, this.remark});

  Map<String, dynamic> toSetVacationJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['vacationStart'] = vacationStart;
    data['vacationEnd'] = vacationEnd;
    data['remark'] = remark;
    return data;
  }

  Map<String, dynamic> toCancelVacationJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['vacationStart'] = vacationStart;
    data['vacationEnd'] = vacationEnd;
    return data;
  }
}
