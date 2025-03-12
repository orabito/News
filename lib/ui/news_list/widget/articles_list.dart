import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/core/reusable_components/EmptyNotificationsScreen.dart';
import 'package:news_application/models/sources_response/Sources.dart';
import 'package:news_application/ui/news_list/widget/article_item.dart';
import 'package:news_application/ui/news_list/widget/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/strings_manager.dart';
import '../../../models/article_response/Article.dart';

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key, required this.source,});

  final Source source;


  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticlesViewModel()
        ..getArticle(widget.source.id ?? "", context.locale.languageCode),
      child: Consumer<ArticlesViewModel>(
        builder: (context, articleModel, child) {
          if (articleModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          } else if (articleModel.errorMessage != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  articleModel.errorMessage.toString().tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(StringsManager.tryAgain.tr()))
              ],
            );
          } else if (articleModel.articles.isEmpty) {
            return
              EmptyNotificationsScreen(onTab: (){
                setState(() {

                });
              });
          }else{
            return ListView.separated(
                itemBuilder: (context, index) => ArticleItem(
                  article: articleModel.articles[index],
                ),
                separatorBuilder: (context, index) => Gap(15.h),
                itemCount: articleModel.articles.length);
          }

        },),
    );






   /* return FutureBuilder(future: ApiManager.getArticles(
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
