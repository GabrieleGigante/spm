library shared_preferences_manager;

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  var _returnValue;
  dynamic getReturnValue() {
    return _returnValue;
  }

  Future<SharedPreferences> getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  ///sets a key/value pair in the preferences
  void setKV(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await getSharedPreferencesInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPreferences.setStringList(key, value);
    }
  }

  ///remove a specific preference
  ///key='all' => removing all of the sharedPreferences
  void removeSpecificSharedPreferences(var key) async {
    SharedPreferences sharedPreferences = await getSharedPreferencesInstance();
    sharedPreferences.remove(key);
  }

  ///gets a Key/Value pair from the preferences
  dynamic getKV(var key, var value) async {
    SharedPreferences sharedPreferences = await getSharedPreferencesInstance();

    if (value is bool) {
      this._returnValue = sharedPreferences.getBool(key);
    } else if (value is String) {
      this._returnValue = sharedPreferences.getString(key);
    } else if (value is int) {
      this._returnValue = sharedPreferences.getInt(key);
    } else if (value is double) {
      this._returnValue = sharedPreferences.getDouble(key);
    } else if (value is List<String>) {
      this._returnValue = sharedPreferences.getStringList(key);
    }
    if (this._returnValue == null) {
      print("valore nullo");
      this._returnValue = value;
    }
    return this._returnValue;
  }

  void addToListString(var key, String value) async {
    SharedPreferences sharedPreferences = await getSharedPreferencesInstance();
    try {
      List<String>? lS = sharedPreferences.getStringList(key);
      lS?.add(value);
      sharedPreferences.setStringList(key, lS!);
    } catch (e) {
      throw ("Problem in adding " +
          value +
          "to the String List, the error was" +
          e.toString());
    }
  }
}
