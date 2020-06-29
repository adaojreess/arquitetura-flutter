import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/widgets.dart';

class AppController {

  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel){
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;

}
