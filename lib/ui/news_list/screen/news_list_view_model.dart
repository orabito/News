import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_application/data/models/sources_response/Sources.dart';
import 'package:news_application/data/repo/sources_repo.dart';
@injectable
class NewsListViewModel extends Cubit<NewsState> {
  SourcesRepo  sourcesRepo;
  @factoryMethod
  NewsListViewModel(this.sourcesRepo):super(NewsLoadingState()) ;
  getSources(String categoryId,String language)async{
    try {
      //handel loading7
      emit(NewsLoadingState());
      var response=await sourcesRepo.getSources(categoryId, language)  ;
      if(response.status=="error"){
        //handel server error
        emit(NewsErrorState(response.message!));
      }else{
        //handel success source from api
        emit(NewsSuccessState(response.sources!));
      }
    } on Exception catch (e) {
      //handel ex error
      emit(NewsErrorState(
          e.toString()
      ));
    }

  }

}
abstract class NewsState{

}
class NewsLoadingState extends NewsState{


}
class NewsErrorState extends NewsState{
  String errorMassage;
  NewsErrorState( this.errorMassage);
}
    class NewsSuccessState  extends NewsState    {
  List<Source>sources;
  NewsSuccessState(this.sources);
    }