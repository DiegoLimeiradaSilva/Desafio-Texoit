import 'dart:convert';

import '../../../../core/shared/failures/not_found_failure.dart';
import '../../../../core/shared/services/http/i_http_service.dart';
import '../../../../core/shared/services/utils/api_url.dart';
import '../../domain/entities/data_movie_entity.dart';

abstract class IApiListMovieDatasource {
  //Dados de filme
  Future<DataMovieEntity> getDataMovie(int page);
}

class ApiListMovieDatasource implements IApiListMovieDatasource {
  final IHttpService _http;

  ApiListMovieDatasource(
    this._http,
  );

  @override
  Future<DataMovieEntity> getDataMovie(int page) async {
    DataMovieEntity? dataMovieEntity;
    Map<String, dynamic> jsonResponse;
    Map<String, dynamic> jsonResponse1;
    try {
      final response = await _http
          .get(
            "?page=10&size=10",
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse = json.decode(response.body);
      final response1 = await _http
          .get(
            "?page=${page.toString()}&size=" +
                (jsonResponse['totalElements'] - 1).toString(),
          )
          .timeout(const Duration(seconds: 30));
      jsonResponse1 = json.decode(response1.body);
      switch (response1.statusCode) {
        case 200:
          dataMovieEntity = DataMovieEntity.fromJson(jsonResponse1);

          return dataMovieEntity;
        case 404:
          throw NotFoundFailure('');
        default:
          throw NotFoundFailure('');
      }
    } catch (e) {
      return DataMovieEntity();
    }
  }
}
