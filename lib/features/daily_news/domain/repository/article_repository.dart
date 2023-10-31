import 'package:cleannewsapp/core/resources/data_state.dart';
import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //database methode

  Future<List<ArticleEntity>> getsavedArticles();
  Future<void> savedArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);


}