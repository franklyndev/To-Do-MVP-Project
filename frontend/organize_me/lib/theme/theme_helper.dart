import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get indigo_300 => Color(0xFF7BA3C8);
  Color get black_900 => Color(0xFF000000);
  Color get blue_100 => Color(0xFFB5D4F4);
  Color get blue_50 => Color(0xFFEAF2FB);
  Color get blue_gray_800 => Color(0xFF1B3A5C);
  Color get blue_gray_100 => Color(0xFFD9D9D9);
  Color get gray_900 => Color(0xFF1A2530);
  Color get indigo_300_01 => Color(0xFF759BBF);
  Color get blue_50_01 => Color(0xFFE8F1FA);
  Color get blue_600 => Color(0xFF378ADD);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get redCustom => Colors.red;
  Color get greyCustom => Colors.grey;
  Color get colorFFE539 => Color(0xFFE53935);
  Color get colorFFFF52 => Color(0xFFFF5252);
  Color get color19D9D9 => Color(0x19D9D9D9);
  Color get color660000 => Color(0x66000000);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
