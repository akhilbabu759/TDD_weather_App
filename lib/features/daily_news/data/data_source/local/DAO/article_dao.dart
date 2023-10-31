
import 'package:cleannewsapp/features/daily_news/data/model/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao{
  @insert
  Future<void> insretArticle(ArticleModl article);

  @delete 
  Future<void>deleteArticle(ArticleModl articleModl);

  @Query('SELECT * From article')
  Future<List<ArticleModl>> getArticle();
}