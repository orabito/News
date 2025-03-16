import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/models/article_response/Article.dart';

class SearchViewModel extends Cubit<SearchState>{
  int _page = 1;
  String? _currentQuery;
  static const int _pageSize = 10;
  final List<Article> _articles = [];
  bool _hasMore = true;
  SearchViewModel():super(InitialSearchState());
  getArticle(String search,{bool loadMore = false}) async {

    try {
      if(!loadMore||_currentQuery!=search){
        _page = 1;
        _articles.clear();
        _hasMore = true;
        _currentQuery = search;
        emit(LoadingSearchState());
      }else if(!_hasMore){
        return;
      }

     final response=await ApiManager.getSearch(search,page: _page,pageSize: _pageSize
      );
     if(response.status=="error"){
     throw Exception(response.message);

     }
      final newArticles = response.articles ?? [];
      _hasMore = newArticles.length >= _pageSize;;
      _articles.addAll(newArticles);


       if(_articles.isEmpty){
         emit(EmptySearchState());
         // emit(SuccessSearchState(response.articles!));
       }
       else {
           emit(SuccessSearchState(_articles, _hasMore));

         }
      if (_hasMore) _page++;
    } on Exception catch (e) {
      // TODO
      emit(ErrorSearchState(e.toString(), _articles));

    }
  }


}



abstract class SearchState{}
class LoadingSearchState extends SearchState {}
class ErrorSearchState extends SearchState {
  String errorMessage;
  final List<Article> articles;


  ErrorSearchState(this.errorMessage,this.articles);
}
class SuccessSearchState extends SearchState {
  List<Article>article;
  final bool hasMore;
  SuccessSearchState(this.article,this.hasMore);
}
class InitialSearchState extends SearchState {}
class EmptySearchState extends SearchState {}