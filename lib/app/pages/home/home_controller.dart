import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/widgets.dart';

class HomeController {

  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);


  ValueNotifier<ApiadvisorModel> get time => viewModel.apiadvisorModel;

  getTime() {
    viewModel.fill();
  }
}