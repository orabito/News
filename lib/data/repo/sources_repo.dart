//abstract class with no attributes &all function are abstract
import 'package:news_application/data/models/sources_response/sources_response.dart';

abstract  class SourcesRepo {
  Future<SourcesResponse>getSources(String categoryId,String language) ;


}