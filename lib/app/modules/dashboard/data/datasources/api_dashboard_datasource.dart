import 'dart:convert';

import 'package:desafiotecnico/app/core/shared/failures/no_connection.dart';
import 'package:desafiotecnico/app/core/shared/failures/unknown_failure.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_Interval_for_producers_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/projection_winners_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/studios_with_win_entity.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/entities/winner_entity.dart';

import '../../../../core/shared/failures/not_found_failure.dart';
import '../../../../core/shared/services/http/i_http_service.dart';
import '../../../../core/shared/services/utils/api_url.dart';

abstract class IApiDashboardDatasource {
  //Anos com mais de um vencedor
  Future<ProjectionWinnersEntity> getProjectionWinners();
  //Intervalo de prêmios
  Future<ProjectionIntervalForProducersEntity> getProjectionForProduces();
  //Estúdios
  Future<StudiosWithWinEntity> getStudiosWithWin();

  //Filme por ano
  Future<List<WinnersEntity>> getWinnersMoviesYear(int year);
}

class ApiDashboardDatasource implements IApiDashboardDatasource {
  final IHttpService _http;

  ApiDashboardDatasource(
    this._http,
  );

  @override
  Future<ProjectionIntervalForProducersEntity>
      getProjectionForProduces() async {
    ProjectionIntervalForProducersEntity? projectionIntervalForProducersEntity;
    Map<String, dynamic> jsonResponse;
    try {
      final response = await _http
          .get(
            "?projection=max-min-win-interval-for-producers",
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          projectionIntervalForProducersEntity =
              ProjectionIntervalForProducersEntity.fromJson(jsonResponse);

          return projectionIntervalForProducersEntity;
        case 404:
          throw NotFoundFailure(jsonResponse["msg"]);
        default:
          throw NotFoundFailure(jsonResponse["msg"]);
      }
    } catch (e) {
      return ProjectionIntervalForProducersEntity();
    }
  }

  @override
  Future<ProjectionWinnersEntity> getProjectionWinners() async {
    ProjectionWinnersEntity? projectionWinnersEntity;
    Map<String, dynamic> jsonResponse;
    try {
      final response = await _http
          .get(
            "/?projection=years-with-multiple-winners",
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          projectionWinnersEntity =
              ProjectionWinnersEntity.fromJson(jsonResponse);

          return projectionWinnersEntity;
        case 404:
          throw NotFoundFailure(jsonResponse["msg"]);
        default:
          throw NotFoundFailure(jsonResponse["msg"]);
      }
    } catch (e) {
      return ProjectionWinnersEntity();
    }
  }

  @override
  Future<StudiosWithWinEntity> getStudiosWithWin() async {
    StudiosWithWinEntity? projectionIntervalForProducersEntity;
    Map<String, dynamic> jsonResponse;
    try {
      final response = await _http
          .get(
            "/?projection=studios-with-win-count",
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          projectionIntervalForProducersEntity =
              StudiosWithWinEntity.fromJson(jsonResponse);

          return projectionIntervalForProducersEntity;
        case 404:
          throw NotFoundFailure(jsonResponse["msg"]);
        default:
          throw NotFoundFailure(jsonResponse["msg"]);
      }
    } catch (e) {
      return StudiosWithWinEntity();
    }
  }

  @override
  Future<List<WinnersEntity>> getWinnersMoviesYear(int year) async {
    List<WinnersEntity>? winnersEntity = [];
    List<dynamic> jsonResponse;
    try {
      final response = await _http
          .get(
            "?winner=true&year=${year.toString()}",
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          if (jsonResponse.length > 0) {
            for (var i = 0; i < jsonResponse.length; i++) {
              winnersEntity.add(WinnersEntity.fromJson(jsonResponse[i]));
            }
          }

          return winnersEntity;
        case 404:
          throw NotFoundFailure('');
        default:
          throw NotFoundFailure('');
      }
    } catch (e) {
      return [];
    }
  }
}
