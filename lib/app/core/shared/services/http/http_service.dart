import 'dart:convert';

import 'package:desafiotecnico/app/core/shared/services/http/i_http_service.dart';
import 'package:desafiotecnico/app/core/shared/services/utils/api_url.dart';
import 'package:http/http.dart';

class HttpService implements IHttpService {
  final Client _http;

  HttpService(this._http);

  @override
  Future post(String uri, {required Map body}) {
    return _http.post(Uri.parse(uri), body: json.encode(body));
  }

  @override
  Future get(String uri) async {
    Response result;
    final url = '${ApiUrl.url}/$uri';
    result = await _http.get(Uri.parse(url));
    return result;
  }
}
