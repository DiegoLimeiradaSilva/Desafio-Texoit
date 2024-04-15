import 'package:desafiotecnico/app/modules/dashboard/data/datasources/api_dashboard_datasource.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_winners_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/studios_with_win_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/winner_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/repositories/dashboard_repository.dart';

import '../../domain/entities/projection_Interval_for_producers_entity.dart';

class DashboardRepository implements IDashboardRepository {
  final IApiDashboardDatasource _apiDatasource;
  const DashboardRepository(
    this._apiDatasource,
  );
  @override
  Future<ProjectionWinnersEntity> getProjectionWinners() async {
    final winners = await _apiDatasource.getProjectionWinners();

    return winners;
  }

  @override
  Future<StudiosWithWinEntity> getProjectionStudioWinners() async {
    // TODO: implement getProjectionStudioWinners
    final winners = await _apiDatasource.getStudiosWithWin();

    return winners;
  }

  @override
  Future<ProjectionIntervalForProducersEntity>
      getProjectionForProduces() async {
    // TODO: implement getProjectionStudioWinners
    final winners = await _apiDatasource.getProjectionForProduces();

    return winners;
  }

  @override
  Future<List<WinnersEntity>> getWinnersMoviesYear(int year) async {
    // TODO: implement getWinnersMoviesYear
    final winners = await _apiDatasource.getWinnersMoviesYear(year);

    return winners;
  }
}
