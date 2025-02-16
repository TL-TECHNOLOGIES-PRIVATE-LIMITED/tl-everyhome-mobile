import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//class for color theme of the application
class LightTheme {
//theme data of the light mode of the application
  ThemeData themeLight = ThemeData.light().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: LigthColor().bgColorGrey,
      // selectedIconTheme: IconThemeData(color: LigthColor().bgColorWhite),
      // selectedLabelStyle: TextStyle(color: LigthColor().textColorWhite),
    ),
    scaffoldBackgroundColor: LigthColor().bgColorWhite,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80.h,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              bottomStart: Radius.circular(10))),
      color: LigthColor().bgColorGrey,
      iconTheme: IconThemeData(color: LigthColor().appBarIconColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
    buttonTheme: ThemeData.light().buttonTheme.copyWith(
          shape: const StadiumBorder(),
          buttonColor: LigthColor().buttonColorYellow,
          minWidth: 343.w,
          height: 55.h,
        ),
    textTheme: ThemeData.light().textTheme.copyWith(
          // Text theme of headline
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 40.sp,
            color: LigthColor().textColorWhite,
          ),
          // Medium title
          titleMedium: TextStyle(
            color: LigthColor().textColorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
          // text theme for small text
          titleSmall: TextStyle(
            color: LigthColor().textColorYellow,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
          displaySmall: TextStyle(
            color: LigthColor().textColorWhite,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 1.2,
            letterSpacing: 1.5,
          ),
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );
//theme data of the dark theme of the application

  // ThemeData themeDark = ThemeData.dark().copyWith(
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     elevation: 0,
  //     backgroundColor: DarkColor().scaffoldBg,
  //     selectedItemColor: LigthColor().buttonColor,
  //   ),
  //   scaffoldBackgroundColor: DarkColor().scaffoldBg,
  //   appBarTheme: AppBarTheme(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           bottom: Radius.circular(20),
  //         ),
  //       ),
  //       color: DarkColor().bgColor,
  //       iconTheme: IconThemeData(
  //         color: LigthColor().buttonColor,
  //       )),
  //   checkboxTheme: CheckboxThemeData(
  //     fillColor: MaterialStateProperty.all(Colors.green),
  //   ),
  //   textTheme: ThemeData.dark().textTheme.copyWith(
  //         displayLarge: TextStyle(
  //           color: DarkColor().textColor,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 24,
  //           height: 1.2,
  //           letterSpacing: 1.5,
  //         ),
  //         displayMedium: TextStyle(
  //           color: DarkColor().cardTextColor.withOpacity(0.5),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 14,
  //           height: 1.2,
  //           letterSpacing: 1.5,
  //         ),
  //         titleMedium: TextStyle(
  //           color: DarkColor().cardTextColor.withOpacity(0.8),
  //           fontWeight: FontWeight.w800,
  //           fontSize: 16,
  //           height: 1.2,
  //           letterSpacing: 1.5,
  //         ),
  //       ),
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     backgroundColor: Colors.blue,
  //   ),
  // );
}

//Light theme colors of the application
class LigthColor {
  final Color textColorWhite = const Color(0xFFFFFFFF);
  final Color textColorBlack = const Color(0xFF232830);
  final Color textColorYellow = const Color(0xffFCB001);
  final Color textColorOffBlack = const Color(0XFF24292F);
  final Color bgColorWhite = const Color(0xFFFFFFFF);
  final Color bgColorGrey = const Color(0xFF252C35);
  final Color bgColorGreyGradient = const Color(0xFF22262B);
  final Color buttonColorYellow = const Color(0xffFCB001);
  final Color buttonTextColorWhite = const Color(0xffffffff);
  final Color buttonColorGrey = const Color(0xFF252C35);
  final Color offWhite = const Color(0xFFEEEEEE);
  final Color appBarColor = const Color(0xFF22262B);
  final Color appBarIconColor = const Color(0xFFFFFFFF);

  // final Color cardColor = const Color(0xFFD6E4E5);
}

//dark theme colors of the application
class DarkColor {
  final Color bgColor = const Color(0xFF222831);
  final Color textColor = const Color(0xffEEEEEE);
  final Color buttonColor = const Color(0xff00ADB5);
  final Color scaffoldBg = const Color(0xFF393E46);
  final Color cardTextColor = const Color(0xFF222831);
}
