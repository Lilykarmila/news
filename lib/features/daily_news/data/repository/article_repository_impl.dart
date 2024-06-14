import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article_response.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/daily_news_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewArticles() {
    // TODO: implement getNewArticles
    throw UnimplementedError();
  }
}
