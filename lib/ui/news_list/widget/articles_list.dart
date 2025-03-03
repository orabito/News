import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_application/ui/news_list/screen/article_item.dart';

class  ArticlesList extends StatelessWidget {
  const  ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return

      ListView.separated(
          itemBuilder: (context, index) => ArticleItem(),
          separatorBuilder: (context, index) => Gap(15.h),
          itemCount: 10
      );
  }
}
