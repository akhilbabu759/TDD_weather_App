

import 'package:cleannewsapp/features/daily_news/data/data_source/local/app_database.dart';
import 'package:cleannewsapp/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleannewsapp/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:cleannewsapp/features/daily_news/domain/repository/article_repository.dart';
import 'package:cleannewsapp/features/daily_news/domain/usecases/get_article.dart';
import 'package:cleannewsapp/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:cleannewsapp/features/daily_news/domain/usecases/remove_article.dart';
import 'package:cleannewsapp/features/daily_news/domain/usecases/save_article.dart';
import 'package:cleannewsapp/features/daily_news/presentation/bloc/article/local/bloc/local_article_bloc.dart';
import 'package:cleannewsapp/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final s1 =GetIt.instance;
Future<void> initializeDependencies()async{
  final database =await $FloorAppDatabase.databaseBuilder('app_database.db').build();
s1.registerSingleton<AppDatabase>(database);

  //dio
  s1.registerSingleton<Dio>(Dio());

  //Dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));


//articleRepo
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1(),s1()));

  //usecase
 s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1()));

 s1.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(s1()));
 s1.registerSingleton<SavedArticleUseCase>(SavedArticleUseCase(s1()));
 s1.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(s1()));
 

 //blocs
 s1.registerFactory<RemoteArticleBlocBloc>(()=>RemoteArticleBlocBloc(s1()));
 s1.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc( s1(), s1(), s1(),));
}