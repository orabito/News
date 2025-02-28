import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/colors_manager.dart';
//size:sp r
//height:h
//width:w
//radius:r
class AppStyle {
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    fontFamily: "Inter",
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color:ColorsManager.black,
        fontSize:20 .sp,
        fontWeight: FontWeight.w500,
      )
    ),
      textTheme: TextTheme(
      labelLarge: TextStyle(
        fontWeight:FontWeight.w700,
fontSize: 24.sp,
            color: ColorsManager.black
      ),
        headlineMedium: TextStyle(
            fontWeight:FontWeight.w600,
            fontSize: 20.sp,
            color: ColorsManager.white
        ),
        bodyLarge: TextStyle(
            fontWeight:FontWeight.w700,
            fontSize: 16.sp,
            color: ColorsManager.black
        ),
        bodyMedium: TextStyle(
            fontWeight:FontWeight.w500,
            fontSize: 14.sp,
            color: ColorsManager.black
        ),
        bodySmall: TextStyle(
            fontWeight:FontWeight.w500,
            fontSize: 12.sp,
            color: ColorsManager.black
        ),

  ),
    colorScheme: ColorScheme.light(
      primary:ColorsManager.black,
      secondary: ColorsManager.white,
      onPrimaryContainer: ColorsManager.white,
      onPrimaryFixed: ColorsManager.black,


    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.white,

    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(color: ColorsManager.white, width: 1.w),
  ),


    ),


  );
  static ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor: ColorsManager.black,
  fontFamily: "Inter",
  appBarTheme: AppBarTheme(
  backgroundColor: Colors.transparent,
  centerTitle: true,
  titleTextStyle: TextStyle(
  color: ColorsManager.black,
  fontSize:20 .sp,
  fontWeight: FontWeight.w500,
  )
  ),
  textTheme: TextTheme(
  labelLarge: TextStyle(
  fontWeight:FontWeight.w700,
  fontSize: 24.sp,
  color: ColorsManager.black
  ),
  headlineMedium: TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 20.sp,
  color: ColorsManager.white
  ),
  bodyLarge: TextStyle(
  fontWeight:FontWeight.w700,
  fontSize: 16.sp,
  color: ColorsManager.white
  ),
  bodyMedium: TextStyle(
  fontWeight:FontWeight.w500,
  fontSize: 14.sp,
  color: ColorsManager.white
  ),
  bodySmall: TextStyle(
  fontWeight:FontWeight.w500,
  fontSize: 12.sp,
  color: ColorsManager.white
  ),),
    colorScheme: ColorScheme.dark(
        primary:ColorsManager.white,
        secondary: ColorsManager.black,
        onPrimaryContainer: ColorsManager.white,
        onPrimaryFixed: ColorsManager.black,

      ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color:ColorsManager.white,width: 2.w ))

    ),
  dividerTheme: DividerThemeData(
        color: ColorsManager.white,

      ),
  );
}