import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles
  // Large text styles typically used for headers and hero elements

  TextStyle get display36BoldInter => TextStyle(
    fontSize: 36.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32BoldInter => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get headline24BoldInter => TextStyle(
    fontSize: 24.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.blue_gray_800,
  );

  TextStyle get headline32RegularInter => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title20BoldInter => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.black_900,
  );

  TextStyle get title16BoldInter => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.black_900,
  );

  TextStyle get title20RegularInter => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.black_900,
  );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get textStyle6 => TextStyle(color: appTheme.white_A700);

  TextStyle get bodyTextBoldInter => TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );
}
