part of 'remote_article_bloc_bloc.dart';

abstract class RemoteArticleBlocState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException ? error;
  const RemoteArticleBlocState({this.article, this.error});
  
  @override
  List<Object> get props => [article!, error!];
}

 class RemoteArticleLoading extends RemoteArticleBlocState {
  const RemoteArticleLoading();

}
class RemoteArticleDone extends RemoteArticleBlocState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(article: article);

}

class RemoteArticleError extends RemoteArticleBlocState {
  const RemoteArticleError(DioException error) : super(error: error);

}
