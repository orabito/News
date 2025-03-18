import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/core/remote/api_constants.dart';
import 'package:news_application/data/models/article_response/Article_response.dart';
import 'package:news_application/data/models/sources_response/sources_response.dart';


class ApiManager {


Future<SourcesResponse> getSources(String category,String language)async{
  //GET https://newsapi.org/v2/top-headlines/sources?apiKey=02c3fa9cbaa34bf9a014c5c681fdc8db&category=business
  /// http.get(Uri.parse(""));this way to handel the request 

 var uri =Uri.https(baseUrl,"/v2/top-headlines/sources",{
  "apiKey":apikey,
  "category":category,
   "language":language
});

  var response =await http.get(uri);

   Map<String,dynamic>json =jsonDecode(response.body);
  SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
  
  return sourcesResponse;


}
 Future<ArticleResponse> getArticles(String source,String language) async {
  ///https://newsapi.org/v2/everything?q=السينما&apiKey=02c3fa9cbaa34bf9a014c5c681fdc8db&sources=cnn&language=ar&excludeDomains=Unlimit-tech.com
  Uri url=Uri.https(baseUrl,"/v2/everything",{
    "apikey": apikey,
    "sources":source,
  "language":language

});
var response =await http.get(url);
Map<String,dynamic> json=jsonDecode(response.body);
  ArticleResponse articleResponse=ArticleResponse.fromJson(json);
  return articleResponse;

}
static Future<ArticleResponse> getSearch(String search,{int page = 1, required pageSize  }) async {
  ///https://newsapi.org/v2/everything?q=السينما&apiKey=02c3fa9cbaa34bf9a014c5c681fdc8db&sources=cnn&language=ar&excludeDomains=Unlimit-tech.com
  Uri url=Uri.https(baseUrl,"/v2/everything",{
    "apikey": apikey,
    "q":search,
    "page": page.toString(),
    "pageSize": pageSize.toString(),


  });
  var response =await http.get(url);
  Map<String,dynamic> json=jsonDecode(response.body);
  ArticleResponse articleResponse=ArticleResponse.fromJson(json);
  return articleResponse;

}

}
