import 'package:shared_preferences/shared_preferences.dart';

void addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

void addIntToSF(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

void addDoubleToSF(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

void addBoolToSF(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<String?> getStringValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString(key);
  return stringValue;
}

Future<int?> getIntValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  int? intValue = prefs.getInt(key);
  return intValue;
}

Future<double?> getDoubleValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double? doubleValue = prefs.getDouble(key);
  return doubleValue;
}

Future<bool?> getBoolValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool? boolValue = prefs.getBool(key);
  return boolValue;
}