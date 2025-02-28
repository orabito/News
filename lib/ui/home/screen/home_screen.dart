import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_application/core/assets_manager.dart';
import 'package:news_application/core/strings_manager.dart';

import '../widget/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String routeName="HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:HomeDrawer(

      ),
      appBar: AppBar(
        title: Text(StringsManager.home.tr(),)
            ,actions: [
              IconButton(onPressed: (){},
              icon: SvgPicture.asset(AssetsManager.searchSvg,colorFilter:ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn)
                ,height: 24.h,
              width: 24.w,),
              )

      ],
      ),
    );
  }
}
