import 'package:arquitetura_flutter/app/app_widget.dart';
import 'package:arquitetura_flutter/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}
