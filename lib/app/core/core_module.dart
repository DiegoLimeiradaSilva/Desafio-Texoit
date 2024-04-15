import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:desafiotecnico/app/core/shared/services/http/http_service.dart';
import 'package:desafiotecnico/app/core/shared/services/http/i_http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<IHttpService>(HttpService.new);
    i.addSingleton(Client.new);
    i.addSingleton(Connectivity.new);
    // i.addSingleton<IConnectionService>(ConnectionService.new);
    //  i.addSingleton(Connectivity.new);
    //  i.addLazySingleton<ILoginRepository>(LoginStore.new);
    // i.addSingleton<IHttpService>(HttpService.new);
    //i.addSingleton<UserStore>(UserStore.new);
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [
        //  UserModule(),
      ];
}
