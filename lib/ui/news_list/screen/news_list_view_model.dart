import 'package:flutter/material.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/models/article_response/Article.dart';
import 'package:news_application/models/sources_response/Sources.dart';


class NewsListViewModel extends ChangeNotifier{
  List<Source>sources=[];
  String? errorMessage;
bool isLoading=false;
  getSources(String category,String language ) async {
try {
  isLoading=true;
  
  var response= await  ApiManager.getSources(category, language);

     if(response?.status=="error"){
       errorMessage= response?.message??"";
       //error
     }else{

       //handel success state from server
       // status her from server

       sources=response?.sources??[];
       isLoading=false;
  
     }

} on Exception catch (e) {

  // TODO
  errorMessage=e.toString();
  isLoading=false;
}
notifyListeners();
    }

}