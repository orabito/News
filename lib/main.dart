import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/app_style.dart';
import 'package:news_application/core/prefs_helper.dart';
import 'package:news_application/provider/theme_provider.dart';
import 'package:news_application/ui/home/screen/home_screen.dart';
import 'package:news_application/ui/search/screen/search_screen.dart';
import 'package:news_application/ui/search/screen/search_view_model.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.init();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      fallbackLocale: Locale("en"),
      supportedLocales: [Locale("en"),Locale("ar")],
      path: 'assets/translations',
      child: ChangeNotifierProvider(create: (context) => ThemeProvider()..initTheme(),

          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ///design size that i have in figma or canva
      designSize: const Size(393, 852),
      ///to text font size
      minTextAdapt: true,
      /// split to two app or open app in
      /// back ground to be responsive also
      splitScreenMode: true,
      builder: (context, child) {
        ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.currentTheme  ,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,


          initialRoute: HomeScreen.routeName ,
          routes: {
            HomeScreen.routeName:(_)=>HomeScreen(),
            SearchScreen.routeName:(_)=>BlocProvider(create: (context) => SearchViewModel(),
        child: SearchScreen())
          },


        );
      },
    );

  }
}
