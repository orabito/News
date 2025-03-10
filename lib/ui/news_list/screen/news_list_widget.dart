import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/remote/api_manager.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/ui/news_list/widget/articles_list.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget( this.category);
  final CategoryModel category;

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  // static const List<String>  sources = [
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(future:ApiManager.getSources(widget.category.id ,context.locale.languageCode) , builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        else if (snapshot.hasError) {
          ///error state
          return Column(
            mainAxisAlignment:  MainAxisAlignment.center,

            children: [
              Text(
                snapshot.error.toString().tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {
setState(() {
});
                  }, child: Text(StringsManager.tryAgain.tr()))
            ],
          );

        }var response=snapshot.data;

         if (response?.status == "error") {
           return Column(
               mainAxisAlignment:  MainAxisAlignment.center,
             children: [
               Text(
               response?.message.toString().tr()??"",
                 style: Theme.of(context).textTheme.titleMedium,
               ),
               ElevatedButton(
                   onPressed: () {
                     setState(() {

                     });
                   }, child: Text(StringsManager.tryAgain.tr()))
             ],
           );

        }

         var sources=response?.sources??[];
          //success state
return  DefaultTabController(
  length:sources.length,
  child: Column(
    children: [

      TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerHeight: 0,
          indicatorColor:Theme.of(context).colorScheme.primary ,
          unselectedLabelStyle:Theme.of(context).textTheme. bodyMedium ,
          labelStyle:Theme.of(context).textTheme. bodyLarge,
          tabs:sources.map((source) =>Tab(
            text:source.name ,
          ) ,).toList()

      ),
      SizedBox(
        height:  15.h,
      ),
      Expanded(
        child: TabBarView(
            children: sources
                .map(
                  (source) => ArticlesList(

                    source:source ,

                  ),
            )
                .toList()),
      )




    ],
  ),
);


   },);
  }
}

