import 'package:news_application/data/data_source/articles_dataSource.dart';
import 'package:news_application/data/models/article_response/Article_response.dart';
import 'package:news_application/data/repo/articles_repo.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  ArticlesDatasource articlesDatasource;
  ArticlesRepoImpl(this.articlesDatasource);
  @override
  Future<ArticleResponse> getArticles(String source, String language) {

return  articlesDatasource.getArticles(source, language);
  }
}