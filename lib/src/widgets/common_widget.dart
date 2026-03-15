import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_general_template/src/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../service/locator/locator.dart';
import '../theme/app_colors.dart';


/// Utility function to create a text widget with specific styles.
///
/// This function takes the required parameters [text], [appTextStyles], and an
/// optional [textOverflow], [maxLines] and [textAlign] to generate a [Text] widget
/// with the specified text content and text styles.
Widget appTextWidget(
    {required String text,
      required TextStyle appTextStyles,
      TextAlign textAlign = TextAlign.center,
      TextOverflow? textOverflow,
      int? maxLines}) =>
    Text(
      text,
      textAlign: textAlign,
      style: appTextStyles,
      overflow: textOverflow,
      maxLines: maxLines,
    );

/// Utility function to create a [BoxShadow] for application cards with customizable properties.
///
/// This function allows customization of the box shadow's [color], [boxShadowSpreadRadius],
/// [boxShadowBlurRadius], and [boxShadowOffset]. If any of these parameters are not provided,
/// default values will be used.
BoxShadow appCardBoxShadow(
    {Color? boxShadowColor,
      double? boxShadowSpreadRadius,
      double? boxShadowBlurRadius,
      Offset? boxShadowOffset}) =>
    BoxShadow(
      color: boxShadowColor ??
          appBlackColor.withValues(alpha: (0.2)), // To Change Opacity
      spreadRadius: boxShadowSpreadRadius ?? 0.r,
      blurRadius: boxShadowBlurRadius ?? 2.r,
      offset: boxShadowOffset ?? const Offset(0, 0),
    );

/// Utility function to create an application image as an [Image] or [SvgPicture] widget.
///
/// This function takes the required parameters [imagePath],and an optional [color],
/// [height], [width] to generate an [Image] or [SvgPicture] widget with the
/// specified dimensions and color.
Widget appImageWidget(
    {double? height,
      double? width,
      Color? color,
      required String imagePath,
      BoxFit? boxFit,
      bool isSvg = false,
      bool isFileImage = false,
      bool isNetwork = false}) {
  if (isSvg && isNetwork) {
    return SvgPicture.network(imagePath,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.contain,
        colorFilter:
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
        errorBuilder: (_, __, ___) => Icon(
          Icons.error,
          color: appBlackColor,
          size: 15.h,
        ));
  }
  if (isSvg) {
    return SvgPicture.asset(imagePath,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.contain,
        colorFilter:
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
        errorBuilder: (_, __, ___) => Icon(
          Icons.error,
          color: appBlackColor,
          size: 15.h,
        ));
  }
  if (isNetwork) {
    return Image.network(imagePath,
        height: height,
        width: width,
        fit: boxFit,
        errorBuilder: (_, __, ___) => Icon(
          Icons.error,
          color: appBlackColor,
          size: 15.h,
        ));
  }
  if (isFileImage) {
    return Image.file(
      File(imagePath),
      height: height,
      width: width,
      color: color,
      fit: boxFit,
      errorBuilder: (_, __, ___) => Icon(
        Icons.error,
        color: appBlackColor,
        size: 15.h,
      ),
    );
  }
  return Image.asset(
    imagePath,
    height: height,
    width: width,
    color: color,
    fit: boxFit,
    errorBuilder: (_, __, ___) => Icon(
      Icons.error,
      color: appBlackColor,
      size: 15.h,
    ),
  );
}

/// Utility function to show a loading dialog with a circular progress indicator.
///
/// The [showLoadingDialog] function is used to display a modal dialog that
/// indicates ongoing loading or processing. It prevents user interaction with
/// the underlying content and includes a circular progress indicator.
Future<void> showLoadingDialog({required BuildContext context}) async {
  FocusManager.instance.primaryFocus?.unfocus();
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 25.h,
        ),
        CupertinoActivityIndicator(radius: 20.r, color: appPrimaryColor),
        SizedBox(
          height: 13.h,
        ),
        appTextWidget(
            text: 'please wait text',
            appTextStyles:
            semiBoldNeutralGreyTextStyle.copyWith(fontSize: 12.sp),
            textAlign: TextAlign.center),
        SizedBox(
          height: 25.h,
        ),
      ],
    ),
  );

  // Show the dialog
  await showDialog(
    context: context,
    barrierDismissible: false,
    // Prevent dialog from closing when tapped outside
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        // Disable back button when the dialog is open
        child: alert,
      );
    },
  );
}

/// Utility function to show SnackBar.
///
/// The [showSnackBar] function shows a [SnackBar] with a floating behavior,
/// a transparent background, and a custom-styled container that includes
/// an animated blinking icon and a message. The SnackBar appears
/// at the bottom of the screen and provides feedback to the user.
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    {required BuildContext context, required String message}) {
  FocusManager.instance.primaryFocus?.unfocus();
  HapticFeedback.vibrate();
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: appErrorColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Row(
          children: [
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.error,
              size: 20.r,
              color: appYellowColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appTextWidget(
                        text: 'oh snap text',
                        appTextStyles: boldWhiteTextStyle.copyWith(fontSize: 16.sp),
                        textAlign: TextAlign.left),
                    appTextWidget(
                        text: message,
                        appTextStyles:
                        regularWhiteTextStyle.copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis),
                  ],
                ))
          ],
        ),
      )));
}

/// Utility function to create a container with a shadow effect.
///
/// The [shadowContainerCard] widget shows a [Container] with a shadow behavior,
/// a the mild Black Shadow background, and a custom-styled container that includes
/// an animated and Explicit Size Container.
Widget shadowContainerCard({required Widget viewOfContainer}) => Container(
  padding: EdgeInsets.all(10.w),
  decoration: BoxDecoration(
      color: appWhiteColor,
      borderRadius: BorderRadius.circular(12.w),
      boxShadow: [
        appCardBoxShadow(
          boxShadowBlurRadius: 1.r,
          boxShadowColor: appBlackColor.withValues(alpha: 0.25),
        ),
      ]),
  child: viewOfContainer,
);

/// The [showConfirmationDialog] function is used to display a modal dialog that
/// indicates The Permission Actions like cancel and confirm.
/// the underlying content and includes a Dialog indicator.
///

/// Utility function to create an application back button as an [Icon] widget.
///
/// This function takes the required parameters [size] to generate an [Icon] widget.
Widget appBackButton(
    {required double size, void Function()? onBeforeBack, Color? iconColor}) {
  return GestureDetector(
    onTap: () {
      !(onBeforeBack == null) ? onBeforeBack.call() : null;
      navigationServiceInst.navigateBack();
    },
    child: Icon(
      Icons.arrow_back,
      color: iconColor,
      size: size,
    ),
  );
}

/// Utility function to show a confirmation dialog.
///
/// The [showConfirmationDialog] function displays an [AlertDialog] to confirm an action.
/// It includes a warning icon, a message indicating the action to be confirmed,
/// and two buttons: one for confirming the action and another for cancelling.
Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  AlertDialog alert = AlertDialog(
    title: appTextWidget(
      text: title,
      appTextStyles: semiBoldNeutralGreyTextStyle.copyWith(fontSize: 16.sp),
      textAlign: TextAlign.left,
    ),
    content: appTextWidget(
      text: message,
      appTextStyles: regularNeutralGreyTextStyle.copyWith(fontSize: 14.sp),
      textAlign: TextAlign.left,
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          navigationServiceInst.navigateBack(); // Close the dialog
        },
        child:const Text('cancelText'),
      ),
      TextButton(
        onPressed: () {
          onConfirm(); // Trigger the onConfirm action
          navigationServiceInst
              .navigateBack(); // Close the dialog after confirmation
        },
        child:const Text('confirm'),
      ),
    ],
  );

  // Show the dialog
  await showDialog(
    context: context,
    barrierDismissible: false, // Prevent dialog dismissal on tapping outside
    builder: (BuildContext context) {
      return alert;
    },
  );
}

FloatingActionButton commonFloatingActionButton(
    {required void Function()? onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    child: Icon(
      Icons.add,
      color: appPrimaryColor ,
    ),
  );
}

