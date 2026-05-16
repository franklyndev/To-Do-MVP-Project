import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// CustomCriarButton - A styled elevated button component
/// with dark blue background and white bold text.
///
/// Arguments:
/// - [text]: Button label text (optional, defaults to "Criar")
/// - [onPressed]: Callback when button is tapped (optional)
/// - [width]: Width of the button (required)
/// - [isLoading]: Whether to show a loading indicator (optional)
class CustomCriarButton extends StatelessWidget {
  const CustomCriarButton({
    Key? key,
    this.text,
    this.onPressed,
    required this.width,
    this.isLoading,
  }) : super(key: key);

  /// Button label text
  final String? text;

  /// Callback when button is tapped
  final VoidCallback? onPressed;

  /// Width of the button
  final double width;

  /// Whether to show a loading indicator
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final bool loading = isLoading ?? false;
    final String label = text ?? "Criar";

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blue_gray_800,
          disabledBackgroundColor: appTheme.blue_gray_800.withAlpha(153),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 10.h,
            left: 30.h,
            right: 30.h,
          ),
          elevation: 0,
        ),
        child: loading
            ? SizedBox(
                height: 24.h,
                width: 24.h,
                child: CircularProgressIndicator(
                  // Modified: Removed const to fix invalid_constant error (appTheme.whiteCustom is not a const)
                  color: appTheme.whiteCustom,
                  strokeWidth: 2,
                ),
              )
            : Text(
                label,
                style: TextStyleHelper.instance.headline32BoldInter.copyWith(
                  height: 39 / 32,
                ),
              ),
      ),
    );
  }
}
