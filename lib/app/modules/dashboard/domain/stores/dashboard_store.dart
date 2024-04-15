import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_Interval_for_producers_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_winners_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/studios_with_win_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/winner_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DashboardStore extends Store {
  final IDashboardRepository _dashboardRepository;
  DashboardStore(this._dashboardRepository) : super('');
  ProjectionWinnersEntity? projectionWinners;
  StudiosWithWinEntity? studiosWithWinEntity;
  List<WinnersEntity>? winnersEntity;
  ProjectionIntervalForProducersEntity? projectionIntervalForProducersEntity;
  int edtyear = 1950;
  int screen = 1;
  Future<void> getProjectionWinners() async {
    setLoading(true);
    try {
      projectionWinners = await _dashboardRepository.getProjectionWinners();
      update(projectionWinners);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  Future<void> getProjectionStudioWithWinner() async {
    setLoading(true);
    try {
      studiosWithWinEntity =
          await _dashboardRepository.getProjectionStudioWinners();
      studiosWithWinEntity!.studios!
          .sort((a, b) => -a.winCount!.compareTo(b.winCount!));
      studiosWithWinEntity!.studios =
          studiosWithWinEntity!.studios!.sublist(0, 3);
      update(studiosWithWinEntity);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  Future<void> getProjectionForProduces() async {
    setLoading(true);
    try {
      projectionIntervalForProducersEntity =
          await _dashboardRepository.getProjectionForProduces();

      update(projectionIntervalForProducersEntity);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  Future<void> getWinnersMoviesYear(int year) async {
    setLoading(true);
    try {
      winnersEntity = await _dashboardRepository.getWinnersMoviesYear(year);

      update(winnersEntity);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }
}
