import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_colors.dart' as AppColors;


/// A reusable, styled button widget.
///
/// Supports primary and outlined variants with [flutter_screenutil] sizing.
class CustomButton extends StatelessWidget {
  /// The button label text.
  final String text;

  /// Callback invoked when the button is tapped.
  final VoidCallback? onPressed;

  /// If `true`, renders an outlined variant instead of filled.
  final bool isOutlined;

  /// If `true`, shows a loading spinner instead of the label.
  final bool isLoading;

  /// Creates a [CustomButton].
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return SizedBox(
        width: double.infinity,
        height: 48.h,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side:  BorderSide(color: AppColors.appPrimaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: _buildChild(AppColors.appPrimaryColor),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appPrimaryColor,
          foregroundColor: AppColors.appChartColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: _buildChild(AppColors.appChartColor),
      ),
    );
  }

  /// Builds either a loading spinner or the text label.
  Widget _buildChild(Color textColor) {
    if (isLoading) {
      return SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
