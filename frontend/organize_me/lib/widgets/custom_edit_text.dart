import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A reusable custom text input field (EditText) widget that supports
/// border styling, background color, hint text, validation, and keyboard type.
///
/// Arguments:
/// - [controller]: Optional TextEditingController for the input field.
/// - [hintText]: Placeholder text shown inside the input field.
/// - [hintStyle]: Optional style for the hint text.
/// - [textStyle]: Optional style for the input text.
/// - [hasBorder]: Whether to show a border around the input field.
/// - [borderColor]: Color of the border when [hasBorder] is true.
/// - [borderRadius]: Border radius value for the input field.
/// - [backgroundColor]: Background color of the input field.
/// - [padding]: Inner padding of the input field.
/// - [prefixIcon]: Optional widget shown at the start of the input field.
/// - [suffixIcon]: Optional widget shown at the end of the input field.
/// - [validator]: Optional validation function for form validation.
/// - [keyboardType]: Type of keyboard to display.
/// - [obscureText]: Whether to obscure the input text (for passwords).
/// - [onChanged]: Callback triggered when the input value changes.
/// - [onTap]: Callback triggered when the input field is tapped.
/// - [readOnly]: Whether the input field is read-only.
/// - [maxLines]: Maximum number of lines for the input field.
/// - [enabled]: Whether the input field is enabled.
/// - [focusNode]: Optional FocusNode for controlling focus.
/// - [initialValue]: Optional initial value for the input field.
class CustomEditText extends StatelessWidget {
  const CustomEditText({
    Key? key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.hasBorder,
    this.borderColor,
    this.borderRadius,
    this.backgroundColor,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.enabled,
    this.focusNode,
    this.initialValue,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool? hasBorder;
  final Color? borderColor;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final int? maxLines;
  final bool? enabled;
  final FocusNode? focusNode;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final bool resolvedHasBorder = hasBorder ?? false;
    final Color resolvedBorderColor = borderColor ?? appTheme.blue_100;
    final double resolvedBorderRadius = borderRadius ?? 20.h;
    final Color resolvedBackgroundColor = backgroundColor ?? appTheme.blue_50;
    final EdgeInsetsGeometry resolvedPadding =
        padding ?? EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h);
    final bool resolvedObscureText = obscureText ?? false;
    final bool resolvedReadOnly = readOnly ?? false;
    final int resolvedMaxLines = maxLines ?? 1;
    final bool resolvedEnabled = enabled ?? true;

    final OutlineInputBorder enabledBorder = resolvedHasBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedBorderRadius),
            borderSide: BorderSide(color: resolvedBorderColor, width: 1.h),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedBorderRadius),
            borderSide: BorderSide.none,
          );

    final OutlineInputBorder focusedBorder = resolvedHasBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedBorderRadius),
            borderSide: BorderSide(color: resolvedBorderColor, width: 1.5.h),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(resolvedBorderRadius),
            borderSide: BorderSide.none,
          );

    final OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(resolvedBorderRadius),
      borderSide: BorderSide(color: appTheme.redCustom, width: 1.h),
    );

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: resolvedObscureText,
      readOnly: resolvedReadOnly,
      maxLines: resolvedMaxLines,
      enabled: resolvedEnabled,
      style: textStyle,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        filled: true,
        fillColor: resolvedBackgroundColor,
        contentPadding: resolvedPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: enabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        disabledBorder: enabledBorder,
      ),
    );
  }
}
