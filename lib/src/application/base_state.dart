import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  /// Override this to provide the screen's main body content.
  Widget buildBody(BuildContext context);

  /// Optional: override to provide an [AppBar].
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  /// Optional: override to provide a [FloatingActionButton].
  Widget? buildFloatingActionButton(BuildContext context) => null;

  /// Optional: override to provide a [BottomNavigationBar].
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: buildBody(context),
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
