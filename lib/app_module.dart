import 'package:arquitetura_flutter/app/app_controller.dart';
import 'package:arquitetura_flutter/app/app_widget.dart';
import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura_flutter/app/pages/home/home_controller.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository_interface.dart';
import 'package:arquitetura_flutter/app/services/client_http_service.dart';
import 'package:arquitetura_flutter/app/services/shared_local_storage_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get())),
      Bind((i) => ApiadvisorViewModel(i.get())),
      Bind<IApiAdvisor>((i) => ApiadvisorRepository(i.get())),
      Bind<ICLientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), lazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageSrvice()),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => null;
}
