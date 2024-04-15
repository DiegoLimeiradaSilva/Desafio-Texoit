import '../entities/data_movie_entity.dart';

abstract class IListMovieRepository {
  // Lista Movies
  Future<DataMovieEntity> getDataMovies(int page);
}
