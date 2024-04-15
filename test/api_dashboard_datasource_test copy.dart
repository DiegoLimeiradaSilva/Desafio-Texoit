import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:desafiotecnico/app/core/shared/services/http/i_http_service.dart';
import 'package:desafiotecnico/app/modules/dashboard/data/datasources/api_dashboard_datasource.dart';
import 'package:desafiotecnico/app/modules/dashboard/domain/stores/dashboard_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../lib/app/core/shared/services/http/http_service.dart';

void main() {
  test('getProjectionForProducess', () async {
    Client _http = Client();

    HttpService http = HttpService(_http);

    ApiDashboardDatasource apiDashboardDatasource = ApiDashboardDatasource(
      http,
    );
    final projectionForProduces =
        await apiDashboardDatasource.getProjectionForProduces();
    int qtdReg = projectionForProduces.max!.length;
    expect(validCallApi(qtdReg), true);
  });
  test('getProjectionWinners', () async {
    Client _http = Client();

    HttpService http = HttpService(_http);

    ApiDashboardDatasource apiDashboardDatasource = ApiDashboardDatasource(
      http,
    );
    final projectionWinnersEntity =
        await apiDashboardDatasource.getProjectionWinners();
    int qtdReg = projectionWinnersEntity.years!.length;
    expect(validCallApi(qtdReg), true);
  });

  test('getStudiosWithWin', () async {
    Client _http = Client();

    HttpService http = HttpService(_http);

    ApiDashboardDatasource apiDashboardDatasource = ApiDashboardDatasource(
      http,
    );
    final studiosWithWinEntity =
        await apiDashboardDatasource.getStudiosWithWin();
    int qtdReg = studiosWithWinEntity.studios!.length;
    expect(validCallApi(qtdReg), true);
  });

  test('getStudiosWithWin', () async {
    Client _http = Client();

    HttpService http = HttpService(_http);

    ApiDashboardDatasource apiDashboardDatasource = ApiDashboardDatasource(
      http,
    );
    final winnersEntity =
        await apiDashboardDatasource.getWinnersMoviesYear(1950);
    int qtdReg = winnersEntity!.length;
    expect(validCallApi(qtdReg), true);
  });
}

bool validCallApi(int qtd) {
  return qtd > 0 ? true : false;
}
