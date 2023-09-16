abstract class BaseApiService {
  Future<dynamic> sendGetApiRequest(String url);
  Future<dynamic> sendPostApiRequest(String url, dynamic data);
}
