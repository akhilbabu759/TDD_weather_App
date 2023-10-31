

import 'dart:developer';

import 'package:cleannewsapp/core/constants/constants.dart';
import 'package:cleannewsapp/features/daily_news/data/model/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService{
  factory NewsApiService(Dio dio) =_NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModl>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
     @Query("country") String ? country,
      @Query("category") String ? category,

  });
}