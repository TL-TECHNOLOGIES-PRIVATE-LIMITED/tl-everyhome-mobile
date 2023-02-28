import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/forget_password_screen/forget_password_screen.dart';
import 'package:every_home/presentation/login/otp_screen/otp_screen.dart';
import 'package:every_home/presentation/login/reset_password_screen/reset_password_screen.dart';
import 'package:every_home/presentation/login/sign_in_screen/sign_in_screen.dart';
import 'package:every_home/presentation/login/sign_up_screen/sign_up_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/cus_book_worker.dart';
import 'package:every_home/presentation/modules/customer/cus_main_screen/cus_main_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/cus_pick_price_range.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_screen/cus_profile_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_date_and_time_screen/cus_date_and_time_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/cus_view_job_card.dart';
import 'package:every_home/presentation/modules/customer/home_screen/home_screen.dart';
import 'package:every_home/presentation/notification_screen/notification_screen.dart';
import 'package:every_home/presentation/splash/onboarding.dart';
import 'package:every_home/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, _) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: MaterialApp(
              title: 'Every home',
              debugShowCheckedModeBanner: false,
              theme: LightTheme().themeLight,
              home: const SplashScreen(),
              routes: {
                '/onboarding': (context) => const Onboarding(),
                '/signin_screen': (context) => const SignInScreen(),
                '/signup_screen': (context) => SignUpScreen(),
                '/otp_screen': (context) => const OtpScreen(),
                '/forget_password_screen': (context) =>
                    const ForgetPasswordScreen(),
                '/reset_password_screen': (context) =>
                    const ResetPasswordScreen(),
                '/customer_home_screen': (context) => const CusHomeScreen(),
                '/notification_screen': (context) => const NotificationScreen(),
                '/cus_main_screen': (context) => CusMainScreen(),
                '/cus_profile_screen': (context) => const CusProfileScreen(),
                '/cus_book_worker': (context) => const CusBookWorker(),
                '/date_and_time_screen': (context) => CusDateAndTimeScreen(),
                '/cus_pick_price_range': (context) => CusPickPriceRange(),
                '/cus_view_job_card': (context) => const CusViewJobCard(),
              },
            ),
          );
        });
  }
}
