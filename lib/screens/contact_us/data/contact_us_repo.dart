import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/contact_us/data/models/contact_us_model.dart';

class SubmitQueryRepository{
  Future<Response>setSubmitQuery(SubmitQueryReqModel reqModel)async{
    return await BaseDio.getInstance().post(Endpoint.submitQuery,data:reqModel);
  }
}