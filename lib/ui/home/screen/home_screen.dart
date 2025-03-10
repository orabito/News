import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_application/core/assets_manager.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/ui/categories/screen/categories_widget.dart';
import 'package:news_application/ui/news_list/screen/news_list_widget.dart';

import '../widget/home_drawer.dart';

class HomeScreen extends StatefulWidget {

static const String routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
bool isShowNewsList=false;
CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:HomeDrawer(
        backToHome: () {

          setState(() {
            selectedCategory=null;
            isShowNewsList=false;
            
          });
        },
      ),
      appBar: AppBar(
        title: Text(selectedCategory!=null?selectedCategory!.title.tr():StringsManager.home.tr(),)
            ,actions: [
              IconButton(onPressed: (){},
              icon: SvgPicture.asset(AssetsManager.searchSvg,colorFilter:ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn)
                ,height: 24.h,
              width: 24.w,),
              )

      ],
      ),

body: isShowNewsList?NewsListWidget( selectedCategory!): CategoriesWidget(onTap: onCategorySelected,),
    );
  }

  onCategorySelected(CategoryModel categoryModel){
    setState(() {
      isShowNewsList=true;
      selectedCategory=categoryModel;

    });


  }
}
