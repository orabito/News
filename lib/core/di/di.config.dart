// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/articles_dataSource.dart' as _i630;
import '../../data/data_source/sources_data_source.dart' as _i748;
import '../../data/data_source_impl/articles_api_dataSource_impl.dart' as _i630;
import '../../data/data_source_impl/sources_api_dataSource_impl.dart' as _i485;
import '../../data/repo/articles_repo.dart' as _i291;
import '../../data/repo/sources_repo.dart' as _i758;
import '../../data/repo_impl/articles_repo_impl.dart' as _i348;
import '../../data/repo_impl/sources_repo_impl.dart' as _i564;
import '../../ui/news_list/screen/news_list_view_model.dart' as _i751;
import '../../ui/news_list/widget/articles_view_model.dart' as _i55;
import '../remote/api_manager.dart' as _i822;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i822.ApiManager>(() => _i822.ApiManager());
    gh.factory<_i630.ArticlesDatasource>(
        () => _i630.ArticlesApiDatasourceImpl(gh<_i822.ApiManager>()));
    gh.factory<_i748.SourcesDataSource>(
        () => _i485.SourcesApiDatasourceImpl(gh<_i822.ApiManager>()));
    gh.factory<_i758.SourcesRepo>(
        () => _i564.SourcesRepoImpl(gh<_i748.SourcesDataSource>()));
    gh.factory<_i751.NewsListViewModel>(
        () => _i751.NewsListViewModel(gh<_i758.SourcesRepo>()));
    gh.factory<_i291.ArticlesRepo>(
        () => _i348.ArticlesRepoImpl(gh<_i630.ArticlesDatasource>()));
    gh.factory<_i55.ArticlesViewModel>(
        () => _i55.ArticlesViewModel(gh<_i291.ArticlesRepo>()));
    return this;
  }
}
