import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_Interval_for_producers_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_winners_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/studios_with_win_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/winner_entity.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/entities/data_movie_entity.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/repositories/list_movie_repository.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ListMoviesStore extends Store {
  final IListMovieRepository _listMovieRepository;
  ListMoviesStore(this._listMovieRepository) : super('');

  DataMovieEntity? movieswinnersEntity;

  Future<void> getListMovies(int page) async {
    setLoading(true);
    try {
      movieswinnersEntity = await _listMovieRepository.getDataMovies(page);

      update(movieswinnersEntity);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }
}
