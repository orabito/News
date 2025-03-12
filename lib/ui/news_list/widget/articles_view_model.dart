
import 'package:flutter/cupertino.dart';
import 'package:news_application/models/article_response/Article.dart';

import '../../../core/remote/api_manager.dart';

class ArticlesViewModel extends ChangeNotifier{
  String? errorMessage;
  bool isLoading=false;
List<Article>articles=[];
  getArticle(String sources,String language) async {
try {
  isLoading=true;
  var response =await ApiManager.getArticles(sources, language);
  if(response.status=="error"){
    errorMessage=response.message??"";
  }
  else{
    articles=response.articles??[];

  }
  isLoading=false;
} on Exception catch (e) {
  isLoading=false;
  errorMessage=e.toString();
  // TODO
}
notifyListeners();

}
}