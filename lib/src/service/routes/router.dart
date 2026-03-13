import 'package:flutter/material.dart';

import '../../modules/home/view/home_view.dart';
import '../../utils/enums.dart';

/// Centralized route generator.
///
/// Maps route names from [Routes] enum to their corresponding
/// screen widgets. Used by `MaterialApp.onGenerateRoute`.
class AppRouter {
  /// Generates a [Route] for the given [RouteSettings].
  ///
  /// Returns the matched screen widget or a 404 fallback.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _ when _ == Routes.homeView.name:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: settings,
        );

      // Add new routes here following the pattern above.
      // case 'loginView':
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginView(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
