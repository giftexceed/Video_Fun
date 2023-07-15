import 'package:dio/dio.dart';
import 'package:video_fun/models/feed_response.dart';

class CreatorRepository {
  final String apiKey =
      "Be4wyVSRMgu0L7PHQePf5DbvsT07X9t2PEx2l1iRwjXrHAxJWEyhEhG2";
  final String mainUrl = "https://api.pexels.com";
  final Dio _dio = Dio();

  Future<FeedResponse> getFeeds() async {
    var getFeedsApi = '$mainUrl/videos/search';

    var params = {
      "api_key": apiKey,
      "query": "video",
      "size": "medium",
      "orientation": "portrait"
    };
    try {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Authorization"] = apiKey;
          _dio.interceptors.requestLock.unlock();
          return handler.next(options);
        },
      ));
      Response response = await _dio.get(getFeedsApi, queryParameters: params);
      return FeedResponse.fromJson(response.data);
    } catch (e) {
      return FeedResponse.withError('$e');
    }
  }
}
