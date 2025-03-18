import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:news_application/data/models/article_response/Article.dart';
import 'package:news_application/data/repo/articles_repo.dart';

@injectable
class ArticlesViewModel extends Cubit<ArticlesState>{
ArticlesRepo repo;
@factoryMethod
  ArticlesViewModel(this.repo):super(ArticleLoadingState()){

    // ApiManager apiManager=ApiManager();
    // ArticlesDatasource datasource=ArticlesApiDatasourceImpl(apiManager);
    // articlesRepo=ArticlesRepoImpl(datasource);
    //Di=>creational design patterns
    //singleton for api manger i gust want one object
    //factory method
    //builder
  }
  getArticle(String sources,String language) async {


try {
  emit(ArticleLoadingState());
  var response=  await repo.getArticles(sources, language);
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