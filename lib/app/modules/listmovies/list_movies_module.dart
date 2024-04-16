import 'package:desafiotecnico/app/core/core_module.dart';
import 'package:desafiotecnico/app/modules/dashboard/data/datasources/api_dashboard_datasource.dart';
import 'package:desafiotecnico/app/modules/dashboard/data/repositories/dashboard_repository.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/stores/dashboard_store.dart';
import 'package:desafiotecnico/app/modules/dashboard/presenter/dashboard_page.dart';
import 'package:desafiotecnico/app/modules/listmovies/data/datasources/api_list_movie_datasource.dart';
import 'package:desafiotecnico/app/modules/listmovies/data/repositories/list_movie_repository.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/repositories/list_movie_repository.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/stores/list_movies_store.dart';
import 'package:desafiotecnico/app/modules/listmovies/presenter/list_movies_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListMoviesModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(ListMoviesStore.new);
    i.addLazySingleton<IListMovieRepository>(ListMovieRepository.new);
    i.addLazySingleton<IApiListMovieDatasource>(ApiListMovieDatasource.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(ListMoviesStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => ListMoviesPage(
        listMoviesStore: Modular.get(),
      ),
    );
  }

  @override
  List<Module> get imports => [
        CoreModule(),
      ];
}
