import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

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
        SizedBox(height: 16.h),
        Text(
          'Welcome Back,',
          style: mediumNeutralGreyTextStyle.copyWith(fontSize: 16.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          'Nasir Mehmood',
          style: boldNeutralGreyTextStyle.copyWith(
            fontSize: 28.sp,
            color: midnightBlueColor,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  /// Builds the loaded content with the given [message].
  Widget buildLoadedContent(String message) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildWelcomeHeader(),
          _buildInfoCard(message),
          SizedBox(height: 32.h),
          _buildActionGrid(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String message) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appPrimaryColor,
            periwinkleBlueColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: appPrimaryColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                  size: 32.w,
                ),
              ),
              Icon(
                Icons.more_horiz_rounded,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'System Status',
            style: regularWhiteTextStyle.copyWith(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: boldWhiteTextStyle.copyWith(fontSize: 22.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildActionGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quick Actions',
              style: boldNeutralGreyTextStyle.copyWith(
                fontSize: 20.sp,
                color: midnightBlueColor,
              ),
            ),
            Text(
              'See All',
              style: mediumNeutralGreyTextStyle.copyWith(
                fontSize: 14.sp,
                color: appPrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionItem(
              icon: Icons.dashboard_customize_rounded,
              title: 'Dashboard',
              color: azureBlueColor,
            ),
            _buildActionItem(
              icon: Icons.analytics_rounded,
              title: 'Analytics',
              color: roseFlushColor,
            ),
            _buildActionItem(
              icon: Icons.settings_rounded,
              title: 'Settings',
              color: emeraldGreenColor,
            ),
            _buildActionItem(
              icon: Icons.security_rounded,
              title: 'Security',
              color: goldenAmberColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            icon,
            color: color,
            size: 28.w,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          title,
          style: mediumNeutralGreyTextStyle.copyWith(
            fontSize: 13.sp,
            color: slateGreyColor,
          ),
        ),
      ],
    );
  }

  /// Builds the loading state UI.
  Widget buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(appPrimaryColor),
      ),
    );
  }

  /// Builds the error state UI with the given [error] message.
  Widget buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: appRedColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 64.w,
                color: appRedColor,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Oops! Something went wrong.',
              style: boldNeutralGreyTextStyle.copyWith(
                fontSize: 20.sp,
                color: midnightBlueColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              error,
              style: regularNeutralGreyTextStyle.copyWith(
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () {
                // To be handled by bloc layer if needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Try Again',
                style: boldWhiteTextStyle.copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
