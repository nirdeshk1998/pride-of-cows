import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/vacation_mode/data/models/vacation_model.dart';
import 'package:poc/screens/vacation_mode/data/vacation_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final vacationModeProvider = ChangeNotifierProvider.autoDispose<VacationModeChangeProvider>(
  (ref) => VacationModeChangeProvider(),
);

class VacationModeChangeProvider extends BaseChangeNotifier {
  final VacationRepository _vacationRepo = VacationRepository();

  bool _vacationMode = false;
  String? _userId;

  DateTime today = DateTime.now();

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  DateTime? _endDate;
  DateTime? get endDate => _endDate;

  bool get vacationMode => _vacationMode;

  VacationReqModel get _vacationReqModel => VacationReqModel(
        userID: _userId,
        vacationStart: _startDate?.toddMMyyyy(),
        vacationEnd: _endDate?.toddMMyyyy(),
        remark: '',
      );

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
  }

  void vacationModeFun(bool i) {
    _vacationMode = i;
    notifyListeners();
  }

  Future<void> _setVacationRequest() async {
    await _vacationRepo.setVacationRepo(_vacationReqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = CommonResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _cancelVacationRequest() async {
    await _vacationRepo.cancelVacationRepo(_vacationReqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = CommonResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  void onSelectStartDate(DateTime? startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  void onSelectEndDate(DateTime? endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  Future<void> onSaveChangesButton() async {
    if (_startDate == null) {
      Utils.showPrimarySnackbar(context, 'Start date is required', type: SnackType.invalidated);
      return;
    }

    if (_vacationMode) {
      await _setVacationRequest();
    } else {
      await _cancelVacationRequest();
    }
  }
}
