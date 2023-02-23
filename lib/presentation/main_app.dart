import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/login/forget_password_screen/forget_password_screen.dart';
import 'package:every_home/presentation/login/otp_screen/otp_screen.dart';
import 'package:every_home/presentation/login/reset_password_screen/reset_password_screen.dart';
import 'package:every_home/presentation/login/sign_in_screen/sign_in_screen.dart';
import 'package:every_home/presentation/login/sign_up_screen/sign_up_screen.dart';
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
          return MaterialApp(
            title: 'Every home',
            debugShowCheckedModeBanner: false,
            theme: LightTheme().themeLight,
            home: const SplashScreen(),
            routes: {
              '/onboarding': (context) => const Onboarding(),
              '/signin_screen': (context) => const SignInScreen(),
              '/signup_screen': (context) => const SignUpScreen(),
              '/otp_screen': (context) => const OtpScreen(),
              '/forget_password_screen': (context) =>
                  const ForgetPasswordScreen(),
              '/reset_password_screen': (context) =>
                  const ResetPasswordScreen(),
              '/customer_home_screen': (context) => const CusHomeScreen(),
              '/notification_screen': (context) => const NotificationScreen(),
            },
          );
        });
  }
}
