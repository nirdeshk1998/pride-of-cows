import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/profile/data/models/profile_model.dart';

class ProfileUpdateRepository{
  Future<Response> sendNewProfileDetails(ProfileUpdateReqModel reqModel)async{
try{
  return await BaseDio.getInstance().post(Endpoint.profileUpdate,data: reqModel.toJson());
}
catch(e){
  throw Exception(e);
}
  }
}