import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publisedhAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.title,
    this.url,
    this.description,
    this.author,
    this.content,
    this.urlToImage,
    this.publisedhAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      author,
      description,
      url,
      title,
      publisedhAt,
      urlToImage,
      content,
    ];
  }
}
