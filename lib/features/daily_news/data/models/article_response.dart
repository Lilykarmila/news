import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publisedhAt,
    String? content,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'],
      urlToImage: map['urlToImage'] ?? "",
      publisedhAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }
}
