import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'article',primaryKeys: ['id'])
class ArticleModl extends ArticleEntity{
   
   const ArticleModl( { 
   int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
}) : super( id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,);

  factory ArticleModl.fromJson(Map<String, dynamic> json) {
    return ArticleModl(
     
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }
  factory ArticleModl.fromEntity(ArticleEntity entity) {
    return ArticleModl(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }





}