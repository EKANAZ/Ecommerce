

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhoneKey = "USERPHONEKEY";
  static String userLastnameKey = "USERLASTNAMEKEY";
  static String userPlaceKey = "USERPLACEKEY";
  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserphone(String phonenumber) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPhoneKey, phonenumber);
  }

  static Future<bool> saveUserlastname(String lastname) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userLastnameKey, lastname);
  }

  static Future<bool> saveUserplace(String place) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPlaceKey, place);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getphoneFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPhoneKey);
  }

  static Future<String?> getlastnameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userLastnameKey);
  }

  static Future<String?> getplaceFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPlaceKey);
  }
}
