import 'package:desafiotecnico/app/modules/listmovies/data/datasources/api_list_movie_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../lib/app/core/shared/services/http/http_service.dart';

void main() {
  test('getDataMovie', () async {
    Client _http = Client();

    HttpService http = HttpService(_http);

    ApiListMovieDatasource apiDashboardDatasource = ApiListMovieDatasource(
      http,
    );
    final movies = await apiDashboardDatasource.getDataMovie(0);
    int qtdReg = movies.content!.length;
    expect(validCallApi(qtdReg), true);
  });
}

bool validCallApi(int qtd) {
  return qtd > 0 ? true : false;
}
