import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/vacation_mode/data/models/vacation_model.dart';

class VacationRepository {
  Future<Response> setVacationRepo(VacationReqModel reqModel) => BaseDio.getInstance().post(
        Endpoint.setVacation,
        data: reqModel.toSetVacationJson(),
      );

  Future<Response> cancelVacationRepo(VacationReqModel reqModel) => BaseDio.getInstance().post(
        Endpoint.cancelVacation,
        data: reqModel.toCancelVacationJson(),
      );
}
