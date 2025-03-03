import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/ui/news_list/widget/articles_list.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});
  static const List<String>  sources = [
    ///dummy data
    "ABC News",
    "ABC News",
    "ABC News",
    "Aftenposten",
    "Ary News",
    "Aftenposten",
    "Ary News",
    "bein",
    "bein",
    "bein",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
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
text:source ,
         ) ,).toList()

         ),
          SizedBox(
            height:  15.h,
          ),
          Expanded(
            child: TabBarView(
                children: sources
                    .map(
                      (source) => ArticlesList(),
                    )
                    .toList()),
          )




        ],
      ),
    );
  }
}
