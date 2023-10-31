part of 'remote_article_bloc_bloc.dart';

abstract class RemoteArticleBlocEvent  {
  const RemoteArticleBlocEvent();

  // @override
  // List<Object> get props => [];
}

class GetArticle extends RemoteArticleBlocEvent{

  const GetArticle();
}
