import 'Article.dart';

class ArticleResponse {
  ArticleResponse({
      this.status, 
      this.totalResults, 
      this.code, 
      this.message, 
      this.articles,});

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  String? code;
  String? message;
  List<Article>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['code'] = code;
    map['message'] = message;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}