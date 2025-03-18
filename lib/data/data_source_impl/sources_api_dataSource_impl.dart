import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/data/data_source/sources_data_source.dart';
import 'package:news_application/data/models/sources_response/sources_response.dart';

class SourcesApiDatasourceImpl extends SourcesDataSource {
  ApiManager apiManager;

  SourcesApiDatasourceImpl(this.apiManager);//constructor  injection this way best one but the best of the best it's (< Di >)
  ///anther way late ApiManager apiManager  SourcesApiDatasourceImpl()=>we have her coupling
  ///{ apiManager=ApiManager() =>but we have her problem  because
  ///if i change any thing an ApiManager must i add her in constructor so i make this class more complex
  ///}
  @override
  Future<SourcesResponse> getSource(String categoryId,String language) {

    // TODO: implement getSource
  return  apiManager.getSources(categoryId, language);
  }
  
}