import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura_flutter/app/models/appconfig_model.dart';
import 'package:arquitetura_flutter/app/services/shared_local_storage_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/widgets.dart';

class AppController {
  static final AppController instance = AppController._();

  AppController._() {
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageSrvice());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;

}
