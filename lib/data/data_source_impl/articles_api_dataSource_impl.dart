import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/data/data_source/articles_dataSource.dart';
import 'package:news_application/data/models/article_response/Article_response.dart';

class ArticlesApiDatasourceImpl implements ArticlesDatasource{
  ApiManager apiManager;
  ArticlesApiDatasourceImpl(this.apiManager);
  @override
  Future<ArticleResponse> getArticles(String source, String language) {
    // TODO: implement getArticles
 return apiManager.getArticles(source, language);
  }
}