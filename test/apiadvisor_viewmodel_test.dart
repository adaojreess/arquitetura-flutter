import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:mockito/mockito.dart';
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
  final mock = ClientHttpMockito();

  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(mock),
  );
  group('ApiadvisorViewModel', () {
    test('ApiAdvisorModel error', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=d9208538987b6dbb8eaed1133e2d23f7"))
          .thenThrow(Exception("Error"));

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorModel success', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=d9208538987b6dbb8eaed1133e2d23f7"))
          .thenAnswer((_) => Future.value([
                ApiadvisorModel(country: "BR", date: "2020/05/30", text: "fds")
                    .toJson()
              ]));
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
