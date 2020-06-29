import 'package:flutter/widgets.dart';

class AppController {

  static final AppController instance = AppController._();

  AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}