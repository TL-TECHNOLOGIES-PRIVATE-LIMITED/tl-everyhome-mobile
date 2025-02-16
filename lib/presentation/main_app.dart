//import 'dart:ffi';
import 'package:every_home/domain/core/theme.dart';
import 'package:every_home/presentation/modules/customer/cus_book_worker/cus_book_worker.dart';
import 'package:every_home/presentation/modules/customer/cus_date_and_time_screen/cus_date_and_time_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_home_screen/cus_home_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_main_screen/cus_main_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_notification_screen/cus_notification_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_pick_price_range/cus_pick_price_range.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_edit_screen/cus_profile_edit_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_profile_screen/cus_profile_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_view_job_card/cus_view_job_card.dart';
import 'package:every_home/presentation/modules/customer/cus_worker_negotiate_screen/cus_worker_negotiate_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_worker_rating_screen/cus_worker_rating_screen.dart';
import 'package:every_home/presentation/modules/customer/cus_works_screen/cus_works_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_create_portfolio_screen/ena_create_portfolio_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_home_screen/ena_home_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_job_details_screen/ena_job_details_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_negotatiate_screen/ena_negotiate_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_notification_screen/ena_notification_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_create_screen/ena_profile_create_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_edit_screen/ena_profile_edit_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_profile_screen/ena_profile_screen.dart';
import 'package:every_home/presentation/modules/enabler/ena_works_screen/ena_work_finish_sreen/ena_work_finish_screen.dart';
import 'package:every_home/presentation/modules/login/create_account_screen/create_account_screen.dart';
import 'package:every_home/presentation/modules/login/forget_password_screen/forget_password_screen.dart';
import 'package:every_home/presentation/modules/login/google_map_screen/google_map_screen.dart';
import 'package:every_home/presentation/modules/login/otp_screen/otp_screen.dart';
import 'package:every_home/presentation/modules/login/reset_password_screen/reset_password_screen.dart';
import 'package:every_home/presentation/modules/login/sign_in_screen/sign_in_screen.dart';
import 'package:every_home/presentation/modules/login/sign_up_screen/sign_up_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_add_product_screen/pro_add_product_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_create_profile_screen/pro_create_profile_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_main_screen/pro_main_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_notification_screen/pro_notification_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_product_showcase_screen/pro_product_showcase_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_profile_edit_screen/pro_profile_edit_screen.dart';
import 'package:every_home/presentation/modules/product_owner/pro_profile_screen/pro_profile_screen.dart';
import 'package:every_home/presentation/splash/onboarding.dart';
import 'package:every_home/presentation/splash/splash_screen.dart';
import 'package:every_home/presentation/support_documents/disclaimer/disclaimer.dart';
import 'package:every_home/presentation/support_documents/privacy_policy/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/enabler/ena_works_screen/enabler_work_completed_screen/ena_work_completed_screen.dart';
import 'modules/enabler/ena_works_screen/enabler_work_pending_screen/ena_work_active_screen.dart';
import 'support_documents/terms_and_conditions/terms_and_conditions.dart';

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
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            title: 'Every home',
            debugShowCheckedModeBanner: false,
            theme: LightTheme().themeLight,
            home: const SplashScreen(),
            routes: {
              '/onboarding': (context) => const Onboarding(),
              // Login module routes
              '/create_account_screen': (context) =>
                  const CreateAccountScreen(),
              '/signin_screen': (context) => const SignInScreen(),
              '/signup_screen': (context) => SignUpScreen(),
              '/otp_screen': (context) => const OtpScreen(),
              '/forget_password_screen': (context) =>
                  const ForgetPasswordScreen(),
              '/reset_password_screen': (context) =>
                  const ResetPasswordScreen(),
              // Customer module routes
              '/customer_home_screen': (context) => const CusHomeScreen(),
              '/cus_works_screen': (context) => CusWorksScreeen(),
              '/notification_screen': (context) => const NotificationScreen(),
              '/cus_main_screen': (context) => CusMainScreen(),
              '/cus_profile_screen': (context) => const CusProfileScreen(),
              '/cus_book_worker': (context) => const CusBookWorker(),
              '/date_and_time_screen': (context) => CusDateAndTimeScreen(),
              '/cus_pick_price_range': (context) => CusPickPriceRange(),
              '/cus_view_job_card': (context) => CusViewJobCard(),
              '/cus_worker_rating_screen': (context) =>
                  const CusWorkerRatingScreen(),
              '/cus_worker_negotiate_screen': (context) =>
                  const CusWorkerNegotiateScreen(),
              '/cus_profile_edit_screen': (context) =>
                  const CusProfileEditScreen(),
              // Enabler module routes
              '/ena_home_screen': (context) => const EnaHomeScreen(),
              '/ena_notification_screen': (context) =>
                  const EnaNotificationScreen(),
              '/ena_job_details_screen': (context) => EnaJobDetailsScreen(),
              '/ena_negotiate_screen': (context) => const EnaNegotiateScreen(),
              '/ena_profile_screen': (context) => const EnaProfileScreen(),
              '/ena_work_finish_screen': (context) =>
                  const EnaWorkFinshScreen(),
              '/ena_work_active_screen': (context) =>
                  const EnaWorkActiveScreen(),
              '/ena_work_completed_screen': (context) =>
                  const EnaWorkCompletedScreen(),
              '/ena_profile_create_screen': (context) =>
                  const EnaProfileCreateScreen(),
              '/ena_create_portfolio_screen': (context) =>
                  const EnaCreatePortfolioScreen(),
              '/ena_profile_edit_screen': (context) =>
                  const EnaProfileEditScreen(),
              // Business module routes
              '/pro_main_screen': (context) => ProMainScreen(),
              '/pro_profile_screen': (context) => const ProProfileScreen(),
              '/pro_profile_edit_screen': (context) => ProProfileEditScreen(),
              '/pro_notification_screen': (context) =>
                  const ProNotificationScreen(),
              '/pro_add_product_screen': (context) => ProAddProductScreen(),
              '/pro_create_profile_screen': (context) =>
                  const ProCreateProfileScreen(),
              '/pro_product_showcase_screen': (context) =>
                  const ProProductShowcaseScreen(),
              '/google_map_screen': (context) => const GoogleMapScreen(),
              // Support Documents route
              '/terms_and_conditions': (context) => const TermsAndConditions(),
              '/privacy_policy': (context) => const PrivacyPolicy(),
              '/disclaimer': (context) => const Disclaimer(),
            },
          ),
        );
      },
    );
  }
}
