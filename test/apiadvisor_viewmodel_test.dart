import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/services/client_http_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arquitetura_flutter/app_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class ClientHttpMock implements ICLientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String utl) async {
    return [
      ApiadvisorModel(country: "BR", date: "2020/05/30", text: "fds").toJson()
    ];
  }
}

class ClientHttpErrorMock implements ICLientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String utl) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements ICLientHttp {}

main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});

  initModule(AppModule(), changeBinds: [
    Bind<ICLientHttp>((i) => ClientHttpService()),
  ]);

  group('ApiadvisorViewModel', () {
    test('ApiAdvisorModel error', () async {
      when(Modular.get<ICLientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=d9208538987b6dbb8eaed1133e2d23f7"))
          .thenThrow(Exception("Error"));
      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorModel success', () async {
      when(Modular.get<ICLientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=d9208538987b6dbb8eaed1133e2d23f7"))
          .thenAnswer((_) => Future.value([
                ApiadvisorModel(country: "BR", date: "2020/05/30", text: "fds")
                    .toJson()
              ]));
      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
