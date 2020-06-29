import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura_flutter/app/models/appconfig_model.dart';
import 'package:arquitetura_flutter/app/services/shared_local_storage_service.dart';
import 'package:flutter/widgets.dart';

class AppController {

  static final AppController instance = AppController._();

  AppController._(){
    storage.get('isDark').then((value) => {
      if (value != null ) config.themeSwitch.value = value
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageSrvice();


  changeTheme(bool value) {
    themeSwitch.value = value;
    storage.put('isDark', value);
  }
}