abstract class IHttpService {
  Future post(String uri, {required Map body});

  Future get(String uri);
}
