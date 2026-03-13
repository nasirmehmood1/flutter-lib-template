import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'service/locator/locator.dart';
import 'service/routes/router.dart';
import 'theme/app_theme.dart';
import 'utils/constants.dart';
import 'utils/enums.dart';

/// Root widget of the application.
///
/// Wraps [MaterialApp] with [ScreenUtilInit] for responsive sizing
/// and uses centralized routing via [AppRouter] and [NavigationService].
class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          navigatorKey: navigationServiceInst.navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: Routes.homeView.name,
        );
      },
    );
  }
}
