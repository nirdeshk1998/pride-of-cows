

import 'package:flutter/cupertino.dart';
import 'package:poc/screens/contact_us/data/contact_us_repo.dart';
import 'package:poc/screens/contact_us/data/models/contact_us_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/utils.dart';

final contactUsProvider=ChangeNotifierProvider.autoDispose<ContactUsChangeProvider>((ref)=> ContactUsChangeProvider());

class ContactUsChangeProvider extends BaseChangeNotifier{

   ContactUsRepository _contactUsRepository=ContactUsRepository();

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

  List<ContactUsData>? contactUsData;
  String? address;
  String? phone;
  String? mobile;
  String? days;
  String? email;

  Future<void> postCreateState()async{

   await _contactDetailsData();

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
    return await _contactUsRepository.setSubmitQuery(submitQueryReqModel).then((response){
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

  Future<void> _contactDetailsData()async{
    return await _contactUsRepository.contactUsDetails().then((response){
     final result=ContactDetailsResModel.fromJson(response.data);
     if (response.statusCode == 200) {

       contactUsData=result.data;
       int count=contactUsData?.length??0;
       for(int i=0;i<count;i++){
        final element=contactUsData?[i];
        if(element?.id==2){
          address=element?.optionValue;
        }
        if(element?.id==3){
          phone=element?.optionValue;
        }
        if(element?.id==4){
          mobile=element?.optionValue;
        }
        if(element?.id==5){
          days=element?.optionValue;
        }
        if(element?.id==6){
          email=element?.optionValue;
        }
       }
       notifyListeners();
     } else {

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


