import 'package:flutter/material.dart';

/// Centralized navigation service using a global [GlobalKey].
///
/// All navigation should go through this service instead of
/// calling `Navigator.push` directly. Resolve from [GetIt].
class NavigationService {
  /// Variables
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Getters
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  // ---------------------------------------------------------------------------
  // [NavigationService] methods
  // ---------------------------------------------------------------------------

  /// Navigates to the screen identified by [routeName].
  ///
  /// Optionally pass [arguments] to the target route.
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    final navigator = _navigatorKey.currentState;
    if (navigator == null) {
      throw StateError('NavigationService used before navigator is attached');
    }
    return navigator.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Pops the current route off the navigator stack.
  void navigateBack() {
    final navigator = _navigatorKey.currentState;
    if (navigator == null) {
      throw StateError('NavigationService used before navigator is attached');
    }
    navigator.pop();
  }

  /// Navigates to [routeName] and removes all previous routes.
  Future<dynamic> navigateAndRemoveUntil(String routeName,
      {Object? arguments}) {
    final navigator = _navigatorKey.currentState;
    if (navigator == null) {
      throw StateError('NavigationService used before navigator is attached');
    }
    return navigator.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  /// Replaces the current route with [routeName].
  Future<dynamic> navigateAndReplace(String routeName, {Object? arguments}) {
    final navigator = _navigatorKey.currentState;
    if (navigator == null) {
      throw StateError('NavigationService used before navigator is attached');
    }
    return navigator.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
}
