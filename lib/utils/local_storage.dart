import 'package:shared_preferences/shared_preferences.dart';

enum StorageField {
  token,
  userId,
  mobileNumber,
  email,
  firstName,
  middleName,
  lastName,
  city,
  cityId,
  flatPlotNumber,
  buildingName,
  streetRoad,
  area,
  landmark,
  pincode,
  addressType,
  customerType,
  deliveryOption,
  gender,
  dob,
  referralCode,
}

class LocalStorage {
  static Future<void> setString(String? value, StorageField field) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(field.name, value ?? '');
  }

  static Future<String?> getString(StorageField field) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(field.name);
  }

  static Future<void> clearSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
