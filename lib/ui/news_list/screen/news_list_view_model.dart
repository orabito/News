import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/models/sources_response/Sources.dart';

class NewsListViewModel extends Cubit<NewsState> {
  NewsListViewModel():super(NewsLoadingState()) ;
  getSources(String category,String language)async{
    try {
      //handel loading7
      emit(NewsLoadingState());
      var response=await ApiManager.getSources(category, language);
      if(response?.status=="error"){
        //handel server error
        emit(NewsErrorState(response!.message!));
      }else{
        //handel success source from api
        emit(NewsSuccessState(response!.sources!));
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