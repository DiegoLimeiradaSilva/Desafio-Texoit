import 'package:desafiotecnico/app/modules/listmovies/domain/entities/data_movie_entity.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/repositories/list_movie_repository.dart';
import 'package:desafiotecnico/app/modules/listmovies/presenter/dataMovie_adapter.dart';
import 'package:desafiotecnico/app/modules/listmovies/presenter/list_movies_page.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ListMoviesStore extends Store {
  final IListMovieRepository _listMovieRepository;
  ListMoviesStore(this._listMovieRepository) : super('');

  DataMovieEntity? movieswinnersEntity;
  DataMovieAdapter? moviesDataSource;
  final int rowsPerPage = 15;

  final double dataPagerHeight = 60.0;

  Future<void> getListMovies(int page) async {
    setLoading(true);
    try {
      movieswinnersEntity = await _listMovieRepository.getDataMovies(page);
      moviesDataSource =
          DataMovieAdapter(movieData: movieswinnersEntity!.content!);
      update(movieswinnersEntity);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }
}
