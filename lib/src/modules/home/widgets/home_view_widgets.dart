import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_text_styles.dart';
import '../../../widgets/loading_indicator.dart';

/// Mixin containing reusable UI components for [HomeView].
///
/// Mixed into the HomeView's State class to keep the main
/// view file clean, per the project architecture guidelines.
mixin HomeViewWidgets {
  /// Builds the welcome header section.
  Widget buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(
          'Flutter General Template',
          style: AppTextStyles.heading1,
        ),
        SizedBox(height: 8.h),
        Text(
          'Your project is set up and ready to go!',
          style: AppTextStyles.bodyMedium,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  /// Builds the loaded content with the given [message].
  Widget buildLoadedContent(String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildWelcomeHeader(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            message,
            style: AppTextStyles.bodyLarge,
          ),
        ),
      ],
    );
  }

  /// Builds the loading state UI.
  Widget buildLoadingState() {
    return const LoadingIndicator();
  }

  /// Builds the error state UI with the given [error] message.
  Widget buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48.w, color: Colors.red),
          SizedBox(height: 16.h),
          Text(
            error,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
