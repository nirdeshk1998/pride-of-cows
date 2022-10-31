import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/contact_us/data/models/contact_us_model.dart';

class ContactUsRepository{
  Future<Response>setSubmitQuery(SubmitQueryReqModel reqModel)async{
    return await BaseDio.getInstance().post(Endpoint.submitQuery,data:reqModel);
  }

  Future<Response>contactUsDetails()async{
    return await BaseDio.getInstance().post(Endpoint.contactUs,data: null);
  }
}

