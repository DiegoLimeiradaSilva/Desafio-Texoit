import '../../domain/entities/data_movie_entity.dart';
import '../../domain/repositories/list_movie_repository.dart';
import '../datasources/api_list_movie_datasource.dart';

class ListMovieRepository implements IListMovieRepository {
  final IApiListMovieDatasource _apiDatasource;
  const ListMovieRepository(
    this._apiDatasource,
  );

  @override
  Future<DataMovieEntity> getDataMovies(int page) async {
    return await _apiDatasource.getDataMovie(page);
  }
}
