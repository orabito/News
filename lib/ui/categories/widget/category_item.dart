
import 'package:easy_localization/easy_localization.dart'as local;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_application/core/strings_manager.dart';


import 'package:news_application/models/category_model.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,required this.categoryModel,required this.showNewsListWidget});
final CategoryModel categoryModel;
 final void Function(CategoryModel) showNewsListWidget;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:categoryModel.textDirection,
      child: Container(

        width: double.infinity,
        height: 198.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(24.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(24.r),
                child: Image.asset(
             categoryModel.imagePath,
              fit: BoxFit.cover,
              width: 161.w,
              height: 198.h,
            )),
            Expanded(
              child: Padding(
                padding:  REdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryModel.title.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ElevatedButton(
      
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          padding: EdgeInsets.zero,
      
      
      
                           ),
                        onPressed: () {
                          showNewsListWidget(categoryModel);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:  REdgeInsetsDirectional.only(start: 10,bottom: 10,top: 10),
                              child: Text(
                                StringsManager.viewAll.tr(),
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            CircleAvatar(
                              radius: 25.r,backgroundColor:  Theme.of(context).colorScheme.secondary,
      
                              child: Icon(Icons.arrow_forward_ios,size: 32.r,
                                  color:Theme.of(context).colorScheme.primary ,
                              ),
                            )
      
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
