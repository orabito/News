import 'package:injectable/injectable.dart';
import 'package:news_application/data/data_source/articles_dataSource.dart';
import 'package:news_application/data/models/article_response/Article_response.dart';
import 'package:news_application/data/repo/articles_repo.dart';
@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl extends ArticlesRepo {
  ArticlesDatasource articlesDatasource;
  @factoryMethod
  ArticlesRepoImpl(this.articlesDatasource);
  @override
  Future<ArticleResponse> getArticles(String source, String language) {

return  articlesDatasource.getArticles(source, language);
  }
}