import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/data/models/article_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:news_app/core/constant/constants.dart';
import 'package:build_runner/build_runner.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headline')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
