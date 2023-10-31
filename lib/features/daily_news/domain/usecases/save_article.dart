
import 'package:cleannewsapp/core/usecases/usecase.dart';
import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';
import 'package:cleannewsapp/features/daily_news/domain/repository/article_repository.dart';

class SavedArticleUseCase implements UseCase<void, ArticleEntity>{
  final ArticleRepository _articleRepository;
  SavedArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.savedArticle(params!);
    
  }
 
}