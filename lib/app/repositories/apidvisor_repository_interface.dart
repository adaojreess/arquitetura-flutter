import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiadvisorModel> getTime();
}