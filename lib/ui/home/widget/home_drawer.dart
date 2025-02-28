import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:news_application/core/assets_manager.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/prefs_helper.dart';
import '../../../provider/theme_provider.dart';



class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  // void initState() {
  //   // TODO: implement initState
  //
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (PrefsHelper.getTheme()) {
  //       selectedTheme = "dark";
  //     }
  //     else {
  //       selectedTheme = "light";
  //     }
  //     setState(() {
  //
  //     });
  //   },);
  //
  // }
  // String selectedTheme="light";

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 166.h,
            width: double.infinity,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            child: Text(
              StringsManager.newsApp.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.home,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        StringsManager.goToHome.tr(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Gap(24.h),
                Divider(),
                Gap(24.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.theme,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimaryContainer,
                          BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      StringsManager.theme.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Gap(8.h),
                InputDecorator(
                  decoration: InputDecoration(),
                  child: DropdownButtonHideUnderline(
                    
                    child: DropdownButton<ThemeMode>(

                      style:  Theme.of(context).textTheme.headlineMedium,
                      borderRadius: BorderRadius.circular(16.r),
                      value: themeProvider.currentTheme,

           dropdownColor: Theme.of(context).colorScheme.onPrimaryFixed,
                      isExpanded: true,
                      iconDisabledColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      iconEnabledColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      iconSize: 32.r,
                      items: [
                        DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text(StringsManager.light.tr(),)),
                        DropdownMenuItem(
                            value:  ThemeMode.dark,
                            child: Text(StringsManager.dark.tr())),
                      ],
                      onChanged: (value) {
themeProvider.changeTheme(value!);
setState(() {

});
                     ///anther way to use theme
                        // setState(() {
                        //
                        //   if(value=="light"){
                        //     themeProvider.changeTheme(ThemeMode.light);
                        //
                        //   }else{
                        //
                        //     themeProvider.changeTheme(ThemeMode.dark);
                        //   }
                        //
                        //
                        // });
                      },
                    ),
                  ),
                ),
                Gap(24.h),
                Divider(),
                Gap(24.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.language,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimaryContainer,
                          BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      StringsManager.language.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Gap(8.h),
                InputDecorator(
                  decoration: InputDecoration(),
                  child: DropdownButtonHideUnderline(

                    child: DropdownButton<String>(

                      style:  Theme.of(context).textTheme.headlineMedium,
                      borderRadius: BorderRadius.circular(16.r),
                      value: context.locale.languageCode,

                      dropdownColor: Theme.of(context).colorScheme.onPrimaryFixed,
                      isExpanded: true,
                      iconDisabledColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                      iconEnabledColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                      iconSize: 32.r,
                      items: [
                        DropdownMenuItem(
                            value: "en",
                            enabled: true,
                            child: Text( StringsManager.english.tr(),)),
                        DropdownMenuItem(
                            value: "ar",
                            child: Text(StringsManager.arabic.tr())),
                      ],
                      onChanged: (value) {
                        context.setLocale(Locale(value!));
                        setState(() {
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
