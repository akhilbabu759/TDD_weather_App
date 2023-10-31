import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cleannewsapp/core/resources/data_state.dart';
import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';
import 'package:cleannewsapp/features/daily_news/domain/usecases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_article_bloc_event.dart';
part 'remote_article_bloc_state.dart';

class RemoteArticleBlocBloc extends Bloc<RemoteArticleBlocEvent, RemoteArticleBlocState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBlocBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    
    on<GetArticle>(onGetArticle);}
    void onGetArticle(GetArticle event,Emitter<RemoteArticleBlocState> emit)async{
      log('dfnsdkn');
      final dataState = await _getArticleUseCase();
      if(dataState is DataSuccess && dataState.data!.isNotEmpty){
        emit(
          RemoteArticleDone(dataState.data!)
        );
      }
      if(dataState is DataFailed){
        emit(RemoteArticleError(dataState.error!));
      }

    }
  }

