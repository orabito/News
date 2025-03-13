import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/models/article_response/Article.dart';

class ArticlesViewModel extends Cubit<ArticlesState>{
  ArticlesViewModel():super(ArticleLoadingState());
  getArticle(String sources,String language) async {


try {
  emit(ArticleLoadingState());
  var response=  await  ApiManager.getArticles(sources, language);
  if(response.message=="error"){
    emit(ArticleErrorState(response.message!));
  }else{

    if(response.articles?.isNotEmpty??false){
      emit(ArticleSuccessState(response.articles!));
    }else{
      emit(ArticleEmptyState());
    }
  }
} on Exception catch (e) {
  emit(ArticleErrorState(e.toString()));}




  }

}


abstract class ArticlesState{}
class ArticleLoadingState extends ArticlesState{

}
class ArticleErrorState extends ArticlesState{
  String errorMassage;
  ArticleErrorState(this.errorMassage);
}
class ArticleSuccessState extends ArticlesState{
  List<Article>articles;
  ArticleSuccessState(this.articles);
}
class ArticleEmptyState extends ArticlesState {

}