import 'package:news_application/data/models/sources_response/sources_response.dart';

abstract class SourcesDataSource {
Future<SourcesResponse>  getSource(String categoryId,String language);

}