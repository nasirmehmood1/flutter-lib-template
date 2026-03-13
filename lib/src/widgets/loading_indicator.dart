import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


/// A reusable loading indicator widget.
///
/// Displays a centered [CircularProgressIndicator].
class LoadingIndicator extends StatelessWidget {
  /// Optional custom color for the spinner.
  final Color? color;

  /// Creates a [LoadingIndicator].
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.primary,
        ),
      ),
    );
  }
}
