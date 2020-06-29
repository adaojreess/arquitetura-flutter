import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageSrvice implements ILocalStorage {
  @override
  Future delete(Pattern key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(Pattern key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(Pattern key, value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) shared.setBool(key, value);
    else if(value is String) shared.setString(key, value);
    else if(value is int) shared.setInt(key, value);
    else if (value is double) shared.setDouble(key, value);
  }
}
