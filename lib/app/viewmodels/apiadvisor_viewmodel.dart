import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository_interface.dart';
import 'package:flutter/widgets.dart';

class ApiadvisorViewModel {
  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  final IApiAdvisor repository;

  ApiadvisorViewModel(this.repository);

  fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch (e) {
      print(e);
    }
  }
}
