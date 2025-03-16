import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_application/models/sources_response/Sources.dart';
import 'package:news_application/ui/news_list/widget/article_item.dart';
import 'package:news_application/ui/news_list/widget/articles_view_model.dart';

import '../../../core/strings_manager.dart';

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key, required this.source,});

  final Source source;


  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    // var language=context.locale.languageCode;
    return BlocProvider(create: (_) => ArticlesViewModel()..getArticle(widget.source.id!,context.locale.languageCode),
    child: BlocBuilder<ArticlesViewModel,ArticlesState>(builder: (context, state) {
      if(state is ArticleLoadingState){
        return Center (
          child: CircularProgressIndicator(
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),
        );
      }
      else if(state is ArticleErrorState){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              state.errorMassage.toString().tr(),
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                }, child: Text(StringsManager.tryAgain.tr()))
          ],
        );

      }
      else if(state is ArticleEmptyState){
        return Center(child: Text(StringsManager.noArticleFound.tr(),
          style: Theme.of(context).textTheme.headlineLarge,));
      }
      else{
        var response=state as ArticleSuccessState;
        return ListView.separated(
            itemBuilder: (context, index) => ArticleItem(
              article:response.articles[index] ,
            ),
            separatorBuilder: (context, index) => Gap(15.h),
            itemCount: response.articles.length
        );
      }


    },) ,

    );
    
    
  /*  return FutureBuilder(future: ApiManager.getArticles(
         widget.source.id??"", context.locale.languageCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center (
            child: CircularProgressIndicator(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
          );
        }
        if (snapshot.hasError) {
//ex error
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                snapshot.error.toString().tr(),
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  }, child: Text(StringsManager.tryAgain.tr()))
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == "error") {
          //ex from response server error
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                response?.message.toString().tr() ?? "",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  }, child: Text(StringsManager.tryAgain.tr()))
            ],
          );
        }
     List<Article> articles=response?.articles??[];
        if(articles.isEmpty){
          return Center(child: Text(StringsManager.noArticleFound.tr(),
          style: Theme.of(context).textTheme.headlineLarge,));
        }
        return ListView.separated(
            itemBuilder: (context, index) => ArticleItem(
              article:articles[index] ,
            ),
            separatorBuilder: (context, index) => Gap(15.h),
            itemCount: articles.length
        );
      },);*/
  }
}
