import 'package:news_application/data/data_source/sources_data_source.dart';
import 'package:news_application/data/models/sources_response/sources_response.dart';

import '../repo/sources_repo.dart';

class SourcesRepoImpl implements  SourcesRepo{
SourcesDataSource sourcesDataSource;
SourcesRepoImpl(this.sourcesDataSource);
  @override
  Future<SourcesResponse> getSources(String categoryId, String language) {
    // TODO: implement getSources

return    sourcesDataSource.getSource(categoryId, language);
  }
}