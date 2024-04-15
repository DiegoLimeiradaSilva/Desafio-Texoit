import 'package:desafiotecnico/app/modules/dashboard/dashboard_module.dart';
import 'package:desafiotecnico/app/modules/listmovies/list_movies_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: DashboardModule());
    r.module('/list', module: ListMoviesModule());
  }
}
