import '../models/article_response/Article_response.dart';

interface class ArticlesDatasource {
  Future<ArticleResponse>getArticles(String source,String language ) {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
}