import 'dart:developer';
import 'dart:io';

import 'package:cleannewsapp/core/constants/constants.dart';
import 'package:cleannewsapp/core/resources/data_state.dart';
import 'package:cleannewsapp/features/daily_news/data/data_source/local/app_database.dart';
import 'package:cleannewsapp/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleannewsapp/features/daily_news/data/model/article.dart';
import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';

import 'package:cleannewsapp/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final AppDatabase appdatabase;
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService, this.appdatabase);
  @override
  Future<DataState<List<ArticleModl>>> getNewsArticles()async {
    try{
       log('hhhhh');

   final httpResponse =await _newsApiService.getNewsArticles(
    apiKey:newsAPIKEY ,
    category: categoryQuery,
    country: countryQuery
   );
   log(httpResponse.response.statusCode.toString());
   if(httpResponse.response.statusCode==HttpStatus.ok){
    return DataSuccess(httpResponse.data);
   } else{
    return DataFailed(DioException(
      error: httpResponse.response.statusMessage,
      response: httpResponse.response,
      type: DioExceptionType.badResponse,
      requestOptions: httpResponse.response.requestOptions
    ));
   }
  } on DioException catch(e){
    log('hhhhh12345');
    log(e.toString());
    return DataFailed(e);

  }
  }

  @override
  Future<List<ArticleEntity>> getsavedArticles() {
  return appdatabase.articleDao.getArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
   return appdatabase.articleDao.deleteArticle(ArticleModl.fromEntity(article));
  }

  @override
  Future<void> savedArticle(ArticleEntity article) {
    return appdatabase.articleDao.insretArticle(ArticleModl.fromEntity(article));
  }

  

}