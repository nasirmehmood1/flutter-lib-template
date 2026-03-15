import 'package:flutter/material.dart';
import 'package:flutter_general_template/src/service/navigation/router.dart';
import 'package:flutter_general_template/src/utils/constants.dart' as AppConstants;
import 'package:flutter_general_template/src/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'service/locator/locator.dart';
import 'theme/app_theme.dart';
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
      designSize: const Size(430, 932),
      minTextAdapt: false,
      child: MaterialApp(
        builder: (context, child) {
          _setScreenDimensions();
          return child ?? Container();
        },
        theme: lightThemeData(),
        restorationScopeId: 'app',
        navigatorKey: appNavigatorKey,
        onGenerateRoute: navigationServiceInst.onGenerateRoute,
      ),
    );
  }
  void _setScreenDimensions() {
    setScreenHeight = ScreenUtil().screenHeight;
    setScreenWidth = ScreenUtil().screenWidth;
  }

}
