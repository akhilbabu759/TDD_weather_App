
import 'package:cleannewsapp/core/usecases/usecase.dart';
import 'package:cleannewsapp/features/daily_news/domain/entities/article.dart';
import 'package:cleannewsapp/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void>{
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getsavedArticles();
    
  }
 
}