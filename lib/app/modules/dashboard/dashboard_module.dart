import 'package:desafiotecnico/app/core/core_module.dart';
import 'package:desafiotecnico/app/modules/dashboard/data/datasources/api_dashboard_datasource.dart';
import 'package:desafiotecnico/app/modules/dashboard/data/repositories/dashboard_repository.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/stores/dashboard_store.dart';
import 'package:desafiotecnico/app/modules/dashboard/presenter/dashboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(DashboardStore.new);
    i.addLazySingleton<IDashboardRepository>(DashboardRepository.new);
    i.addLazySingleton<IApiDashboardDatasource>(ApiDashboardDatasource.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(DashboardStore.new);
    //  i.addLazySingleton<ILoginRepository>(LoginRepository.new);
    // i.addLazySingleton<IApiLoginDatasource>(ApiLoginDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => DashBoardPage(
        dashStore: Modular.get(),
      ),
    );
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [
        CoreModule(),
      ];
}
