

import 'package:flutter/cupertino.dart';
import 'package:poc/screens/contact_us/data/contact_us_repo.dart';
import 'package:poc/screens/contact_us/data/models/contact_us_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/utils.dart';

final contactUsProvider=ChangeNotifierProvider.autoDispose<ContactUsChangeProvider>((ref)=> ContactUsChangeProvider());

class ContactUsChangeProvider extends BaseChangeNotifier{

   SubmitQueryRepository _submitQueryRepository=SubmitQueryRepository();

  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _phoneNoController=TextEditingController();
  final TextEditingController _emailIdController=TextEditingController();
  final TextEditingController _locationController=TextEditingController();
  final TextEditingController _messageController=TextEditingController();

  TextEditingController? get nameController=>_nameController;
  TextEditingController? get phoneNoController=>_phoneNoController;
  TextEditingController? get emailIdController=>_emailIdController;
  TextEditingController? get locationController=>_locationController;
  TextEditingController? get messageController=>_messageController;


  Future<void> postCreateState()async{

  }

  Future<void> onSubmitQuery(context)async{
    if(_nameController.text.isEmpty){
      Utils.showPrimarySnackbar(context, 'Full name is required',
          type: SnackType.invalidated);
      return;
    }
    else if(_phoneNoController.text.isEmpty){
      Utils.showPrimarySnackbar(context, 'Phone number is required',
          type: SnackType.invalidated);
      return;
    }
    else if(_emailIdController.text.isEmpty){
      Utils.showPrimarySnackbar(context, 'Email id is required',
          type: SnackType.invalidated);
      return;
    }
    else if(_locationController.text.isEmpty){
      Utils.showPrimarySnackbar(context, 'Location is required',
          type: SnackType.invalidated);
      return;
    }
    else if (_emailIdController.text.isNotEmpty) {
      bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailIdController.text);
      print(emailValid);
      if (!emailValid) {
        Utils.showPrimarySnackbar(context, 'Invalid Email',
            type: SnackType.invalidated);
        return;
      } else {}
  }
    showLoader(true);
    await _submitQueryData(context);
    showLoader(false);
    clearTextField();

  }

  SubmitQueryReqModel get submitQueryReqModel=>SubmitQueryReqModel(
    name:_nameController.text,
    mobile: _phoneNoController.text,
    email: _emailIdController.text,
    location: _locationController.text,
  );
  Future<void> _submitQueryData(context)async{
    return await _submitQueryRepository.setSubmitQuery(submitQueryReqModel).then((response){
      final result=SubmitQueryResModel.fromjson(response.data);
      if (response.statusCode == 200) {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error.toString(),
          type: SnackType.debug);
    });
  }
  void clearTextField(){
    _nameController.clear();
    _phoneNoController.clear();
    _locationController.clear();
    _emailIdController.clear();
    _messageController.clear();
  }
}


