import 'package:news_application/data/models/article_response/Article_response.dart';

abstract class ArticlesRepo {
  Future<ArticleResponse>getArticles(String source,String language);

}