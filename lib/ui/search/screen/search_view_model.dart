import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/data/models/article_response/Article.dart';

class SearchViewModel extends Cubit<SearchState> {
  int _page = 1;
  String? _currentQuery;
  static const int _pageSize = 10;
  final List<Article> _articles = [];
  bool _hasMore = true;
  bool _isLoadingMore = false;

  SearchViewModel() : super(InitialSearchState());

// في الـ ViewModel
  Future<void> getArticle(String search, {bool loadMore = false}) async {
    try {
      if (!loadMore || _currentQuery != search) {
        _page = 1;
        _articles.clear();
        _hasMore = true;
        _currentQuery = search;
        emit(LoadingSearchState());
      }

      if (loadMore && (!_hasMore || _isLoadingMore)) return;

      if (loadMore) {
        _isLoadingMore = true;
        emit(SuccessSearchState(_articles, _hasMore, isLoadingMore: true));
      }

      final response = await ApiManager.getSearch(
        search,
        page: _page,
        pageSize: _pageSize,
      );

      final newArticles = response.articles ?? [];
      _hasMore = newArticles.length >= _pageSize;
      _articles.addAll(newArticles);

      if (_articles.isEmpty) {
        emit(EmptySearchState());
      } else {
        emit(SuccessSearchState(_articles, _hasMore, isLoadingMore: false));
      }

      if (_hasMore) _page++;
    } catch (e) {
      emit(ErrorSearchState(e.toString(), _articles));
    } finally {
      _isLoadingMore = false;
    }
  }
}



abstract class SearchState{}
class LoadingSearchState extends SearchState {

}
class ErrorSearchState extends SearchState {
  String errorMessage;
  final List<Article> articles;


  ErrorSearchState(this.errorMessage,this.articles);
}
class SuccessSearchState extends SearchState {
  List<Article>article;
  final bool hasMore;
  final bool isLoadingMore;
  SuccessSearchState(this.article, this.hasMore, {this.isLoadingMore = false});}
class InitialSearchState extends SearchState {}
class EmptySearchState extends SearchState {}

// class LoadingMoreSearchState extends SearchState {
//   final List<Article> articles;
//   final bool hasMore;
//   LoadingMoreSearchState(this.articles, this.hasMore);
// }