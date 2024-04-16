import 'package:desafiotecnico/app/modules/dashboard/domain/entities/studios_with_win_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/winner_entity.dart';

import '../entities/projection_Interval_for_producers_entity.dart';
import '../entities/projection_winners_entity.dart';

abstract class IDashboardRepository {
  Future<ProjectionWinnersEntity> getProjectionWinners();
  Future<StudiosWithWinEntity> getProjectionStudioWinners();
  Future<ProjectionIntervalForProducersEntity> getProjectionForProduces();
  Future<List<WinnersEntity>> getWinnersMoviesYear(int year);
}
