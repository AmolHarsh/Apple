import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {


  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNamedKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  //saving the data to the shared preferences
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNamedKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }
  //getting the data from SF (shared preference)
  static Future <bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    //if the particular key exists inside the shared preference then it returns true else false
    return sf.getBool(userLoggedInKey);
  }

  static Future <String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    //if the particular key exists inside the shared preference then it returns the value
    return sf.getString(userEmailKey);
  }

  static Future <String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    //if the particular key exists inside the shared preference then it returns the value
    return sf.getString(userNamedKey);
  }
  

}