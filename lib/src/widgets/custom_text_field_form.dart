import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_general_template/src/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'common_widget.dart';


class CustomTextFormField extends StatefulWidget {
  /// Private Variables

  final List<TextInputFormatter>? _inputFormatters;
  final TextEditingController _textEditingController;
  final TextInputAction _textInputAction;
  final bool _isPasswordField;
  final TextInputType _textInputType;
  final String _hintText;
  final String? Function(String?)? _validatorFunction;
  final int? _maxLines;
  final TextCapitalization _textCapitalization;
  final bool _isFieldReadOnly;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final void Function(String)? _onChanged;
  final void Function()? _onTap;
  final void Function(String)? _onFieldSubmitted;
  final FocusNode? _focusNode;
  final TextStyle? _style;
  final TextStyle? _hintStyle;
  final int? _maxLength;
  final AutovalidateMode? _autoValidateMode;
  final bool _showLabel;
  final String _label;
  final bool _isRequired;
  final bool _isFieldBorderUnderline;
  final Color? _filledColor;
  final double? _fieldHeight;
  final double? _fieldRadius;
  final ScrollController? _scrollController;
  final bool _shrinkWrap;

  /// A custom text form field widget for the UCast Mobile application.
  ///
  /// The [CustomTextFormField] class provides a reusable widget for creating customizable
  /// text form fields with various properties such as input formatters, controller,
  /// input action, password visibility, input type, hint text, validation function, and more.
  CustomTextFormField(
      {super.key,
        Color? filledColor,
        List<TextInputFormatter>? inputFormatters,
        required TextEditingController textEditingController,
        TextInputAction textInputAction = TextInputAction.done,
        bool isPasswordField = false,
        TextInputType textInputType = TextInputType.text,
        required String hintText,
        String? Function(String?)? validatorFunction,
        int? maxLines = 1,
        TextCapitalization textCapitalization = TextCapitalization.none,
        bool isFieldReadOnly = false,
        Widget? prefixIcon,
        Widget? suffixIcon,
        void Function(String)? onChanged,
        void Function()? onTap,
        FocusNode? focusNode,
        TextStyle? style,
        TextStyle? hintStyle,
        int? maxLength,
        AutovalidateMode? autoValidateMode,
        void Function(String)? onFieldSubmitted,
        bool showLabel = false,
        String label = '',
        bool isRequired = false,
        bool isFieldBorderUnderline = false,
        double? fieldHeight,
        double? fieldRadius,
        ScrollController? scrollController,
        bool shrinkWrap = false})
      : assert((showLabel && label.isNotEmpty) || (!showLabel && label.isEmpty),
  'textFormFieldLabelErrorMessage'),
        _filledColor = filledColor,
        _inputFormatters = inputFormatters,
        _textEditingController = textEditingController,
        _textInputAction = textInputAction,
        _isPasswordField = isPasswordField,
        _textInputType = textInputType,
        _hintText = hintText,
        _validatorFunction = validatorFunction,
        _maxLines = maxLines,
        _textCapitalization = textCapitalization,
        _isFieldReadOnly = isFieldReadOnly,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _onChanged = onChanged,
        _onTap = onTap,
        _focusNode = focusNode,
        _style = style,
        _hintStyle = hintStyle,
        _maxLength = maxLength,
        _autoValidateMode = autoValidateMode,
        _showLabel = showLabel,
        _label = label,
        _onFieldSubmitted = onFieldSubmitted,
        _isRequired = isRequired,
        _isFieldBorderUnderline = isFieldBorderUnderline,
        _fieldHeight = fieldHeight,
        _fieldRadius = fieldRadius,
        _scrollController = scrollController,
        _shrinkWrap = shrinkWrap;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  /// View

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget._showLabel) ...[
          Row(
            children: [
              SizedBox(
                width: 2.w,
              ),
              appTextWidget(
                  text: widget._label,
                  appTextStyles: mediumNeutralGreyTextStyle.copyWith(
                      fontSize: 16.sp, letterSpacing: 0.1)),
              SizedBox(
                width: 4.w,
              ),
              widget._isRequired
                  ? appTextWidget(
                  text: "*",
                  appTextStyles: mediumNeutralGreyTextStyle.copyWith(
                      fontSize: 16.sp, letterSpacing: 0.1))
                  : Container(),
            ],
          ),
          SizedBox(height: 10.h),
        ],
        widget._shrinkWrap
            ? Expanded(
          child: Align(
            alignment: Alignment.center,
            child: _buildTextField(context),
          ),
        )
            : SizedBox(
            height: widget._fieldHeight, child: _buildTextField(context)),
      ],
    );
  }

  /// Returns the input text-form-field
  Widget _buildTextField(BuildContext context) => TextFormField(
    scrollPadding: EdgeInsets.all(100.h),
    scrollController: widget._scrollController,
    onFieldSubmitted: widget._onFieldSubmitted,
    autovalidateMode: widget._autoValidateMode,
    maxLength: widget._maxLength,
    onTap: widget._onTap,
    focusNode: widget._focusNode,
    inputFormatters: widget._inputFormatters,
    controller: widget._textEditingController,
    textInputAction: widget._textInputAction,
    obscureText: widget._isPasswordField && !_isPasswordVisible,
    obscuringCharacter: '*',
    keyboardType: widget._textInputType,
    validator: widget._validatorFunction,
    maxLines: widget._maxLines,
    textCapitalization: widget._textCapitalization,
    readOnly: widget._isFieldReadOnly,
    // style: widget._style ??
    //     (widget._isFieldReadOnly
    //         ? semiBoldNeutralGreyTextStyle.copyWith(fontSize: 16.sp)
    //         : regularBlackTextStyle.copyWith(fontSize: 16.sp)),
    onChanged: widget._onChanged,
    decoration: _nonCollapsedInputDecoration(context),
  );

  /// Returns the input decoration for non-collapsed mode.
  InputDecoration _nonCollapsedInputDecoration(BuildContext context) {
    return InputDecoration(
        fillColor: widget._filledColor,
        filled: widget._filledColor != null ? true : false,
        enabledBorder: widget._isFieldBorderUnderline
            ? _underlineInputBorder(borderColor: silverMistColor)
            : widget._fieldRadius != null
            ? _outlineInputBorder(borderColor: silverMistColor)
            : null,
        border: widget._isFieldBorderUnderline
            ? _underlineInputBorder(borderColor: silverMistColor)
            : widget._fieldRadius != null
            ? _outlineInputBorder(borderColor: silverMistColor)
            : null,
        focusedBorder: widget._isFieldBorderUnderline
            ? _underlineInputBorder(borderColor: appPrimaryColor)
            : widget._fieldRadius != null
            ? _outlineInputBorder(borderColor: appPrimaryColor)
            : null,
        errorBorder: widget._isFieldBorderUnderline
            ? _underlineInputBorder(borderColor: appErrorColor)
            : widget._fieldRadius != null
            ? _outlineInputBorder(borderColor: appErrorColor)
            : null,
        focusedErrorBorder: widget._isFieldBorderUnderline
            ? _underlineInputBorder(borderColor: appErrorColor)
            : widget._fieldRadius != null
            ? _outlineInputBorder(borderColor: appErrorColor)
            : null,
        prefixIcon: widget._prefixIcon,
        suffixIcon: widget._isPasswordField
            ? _buildEyeSuffixIcon()
            : widget._suffixIcon,
        hintText: widget._hintText,
        hintStyle: widget._hintStyle,
        contentPadding: _getContentPadding());
  }

  /// Returns an underline input border with the specified [borderColor] and [borderWidth].
  InputBorder _underlineInputBorder(
      {Color borderColor = const Color(0xFF000000), double borderWidth = 1.0}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
  }

  /// Returns an input border with the specified [borderColor] and [borderWidth].
  InputBorder _outlineInputBorder(
      {Color borderColor = const Color(0xFF000000), double borderWidth = 1.0}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(widget._fieldRadius ?? 6.0.r));
  }

  /// Returns the content padding for the text field based on its height and border type.
  EdgeInsetsGeometry? _getContentPadding() {
    if (widget._fieldHeight != null && !widget._isFieldBorderUnderline) {
      double bottom = widget._scrollController != null ? 5 : 0;

      return EdgeInsets.fromLTRB(12, 0, 12, bottom);
    }

    if (widget._scrollController != null) {
      return const EdgeInsets.fromLTRB(12, 0, 12, 5);
    }
    return null;
  }

  /// Builds an eye icon as a suffix for password visibility toggle in a text field.
  Widget _buildEyeSuffixIcon() {
    return IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: appBlackColor,
      ),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}

