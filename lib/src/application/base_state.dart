import 'dart:io';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Abstract base state class to reduce boilerplate in stateful screens.
///
/// Extend this instead of [State] directly to get:
/// - A mandated [buildBody] method for the main content.
/// - Automatic [SafeArea] and [Scaffold] wrapping.
///
/// Usage:
/// ```dart
/// class _MyViewState extends BaseState<MyView> {
///   @override
///   Widget buildBody(BuildContext context) {
///     return const Center(child: Text('Hello'));
///   }
/// }
/// ```
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  Color _screenBackgroundColor = appWhiteColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _screenBackgroundColor,
      body: GestureDetector(
          onTap: () {
            if (Platform.isIOS && FocusScope.of(context).hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: buildBody(context)),
      drawer: appDrawer(context),
      appBar: appBar(context),
      bottomNavigationBar: appBottomNavigationBar(context),
      floatingActionButton: floatingActionButton(context),
    );
  }

  /// Abstract method for building the main body of the screen.
  /// This method must be implemented by classes extending [BaseState].
  Widget buildBody(BuildContext context);

  /// Optional method for providing a [FloatingActionButton].
  /// By default, returns `null` to indicate no floating action button.
  FloatingActionButton? floatingActionButton(BuildContext context) {
    return null;
  }

  /// Optional method for providing a `Drawer`.
  /// By default, returns `null` to indicate no drawer.
  Widget? appDrawer(BuildContext context) {
    return null;
  }

  /// Optional method for providing a `BottomNavigationBar`.
  /// By default, returns `null` to indicate no bottom navigation bar.
  Widget? appBottomNavigationBar(BuildContext context) {
    return null;
  }

  /// Optional method for providing an `AppBar`.
  /// By default, returns `null` to indicate no app bar.
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  Color get screenBackgroundColor => _screenBackgroundColor;

  set setScreenBackgroundColor(Color screenBackgroundColor) {
    _screenBackgroundColor = screenBackgroundColor;
  }
}

