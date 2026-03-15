import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_general_template/src/modules/bottom_nav/view/bottom_nav_view.dart';

import '../../modules/home/view/home_view.dart';
import '../../utils/enums.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  /// A service class for handling navigation in the UCast Mobile application.
  ///
  /// The [NavigationService] class provides methods for navigating between
  /// different screens in the application.
  NavigationService();

  late final Map<String, Widget Function(dynamic)> _appRoutes = _initRoutes();

  Map<String, Widget Function(dynamic)> _initRoutes() {
    final Map<String, Widget Function(dynamic)> routes = {
      Routes.bottomNavView.name: (_) => const BottomNavView(),
      Routes.homeView.name: (_) => const HomeView(),

      // Add other routes as needed
    };

    // Assertion to check if all enum values have corresponding routes
    assert(Routes.values.every((route) => routes[route.name] != null),
    'Make sure to update the _appRoutes map when updating the Routes enum.');

    return routes;
  }

  /// Callback for route generation based on the provided [settings].
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _appRoutes[settings.name!] != null
        ? Platform.isIOS
        ? CupertinoPageRoute(
      settings: settings,
      builder: (_) => _appRoutes[settings.name]!(settings.arguments),
    )
        : MaterialPageRoute(
      settings: settings,
      builder: (_) => _appRoutes[settings.name]!(settings.arguments),
    )
        : MaterialPageRoute(builder: (_) => const BottomNavView());
  }

  /// Pushes a new route onto the navigator stack and removes all other routes.
  Future<dynamic> pushAndRemoveAll(
      String routeName, [
        Object? arguments,
      ]) async {
    return appNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  /// Navigates to a new route on the navigator stack.
  Future<dynamic> navigateTo(
      String routeName, {
        Object? arguments,
        bool replace = false,
      }) async {
    if (replace) {
      return appNavigatorKey.currentState
          ?.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return appNavigatorKey.currentState
          ?.pushNamed(routeName, arguments: arguments);
    }
  }

  /// Navigates to previous route on the navigator stack.
  Future<dynamic> navigateBack({Object? result}) async {
    return appNavigatorKey.currentState?.pop(result);
  }
}
