import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/ui/categories/widget/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key,required this.onTap});
  final void Function(CategoryModel category)onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(15.0),
      child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringsManager.goodMorning.tr(),style:Theme.of(context).textTheme.headlineLarge ,),
        Text(StringsManager.someNews.tr(),style:Theme.of(context).textTheme.headlineLarge ,),
        Gap(16.h),

        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CategoryItem(
                      categoryModel: CategoryModel.categories[index],
                      showNewsListWidget: onTap,
                    ),
                separatorBuilder:(context, index) => SizedBox(
            height:16.h ,
          ), itemCount: CategoryModel.categories.length),
        )
      ],

      ),
    );
  }
}
