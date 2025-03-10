import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/core/remote/api_constants.dart';
import 'package:news_application/models/sources_response/sources_response.dart';

import '../../models/article_response/Article_response.dart';

class ApiManager {


static Future<SourcesResponse?> getSources(String category,String language)async{
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
static Future<ArticleResponse> getArticles(String sources,String language) async {
  ///https://newsapi.org/v2/everything?q=السينما&apiKey=02c3fa9cbaa34bf9a014c5c681fdc8db&sources=cnn&language=ar&excludeDomains=Unlimit-tech.com
  Uri url=Uri.https(baseUrl,"/v2/everything",{
    "apikey": apikey,
    // "q":"العام",
    "sources":sources,
  "language":language

});
var response =await http.get(url);
Map<String,dynamic> json=jsonDecode(response.body);
  ArticleResponse articleResponse=ArticleResponse.fromJson(json);
  return articleResponse;

}
}