import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final ICLientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiadvisorModel> getTime() async {
    var json = await client.get(
        'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=d9208538987b6dbb8eaed1133e2d23f7');
    ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);
    return model;
  }
}
