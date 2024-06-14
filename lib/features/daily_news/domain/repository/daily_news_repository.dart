import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewArticles();
}
