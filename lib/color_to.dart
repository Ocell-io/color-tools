import 'package:colorful/color_tabels.dart';
import 'package:flutter/painting.dart';

extension ColorTo on Color {
  /// Converts a color to a color code #rrggbb
  ///
  /// ```dart
  /// Color(0xFFAABBCC).toColorCode() == '#aabbcc'
  /// ```
  String toCode() {
    final r = red.toRadixString(16).padLeft(2, '0');
    final g = green.toRadixString(16).padLeft(2, '0');
    final b = blue.toRadixString(16).padLeft(2, '0');
    return '#$r$g$b';
  }

  /// Converts a color to a color code #aarrggbb
  ///
  /// ```dart
  /// Color(0xFFAABBCC).toCodeWithAlpha() == '#ffaabbcc'
  /// ```
  String toCodeWithAlpha() {
    final a = alpha.toRadixString(16).padLeft(2, '0');
    final r = red.toRadixString(16).padLeft(2, '0');
    final g = green.toRadixString(16).padLeft(2, '0');
    final b = blue.toRadixString(16).padLeft(2, '0');
    return '#$a$r$g$b';
  }

  /// Converts a color to a rgb string
  ///
  /// ```dart
  /// Color(0xFFAABBCC).toRGB() == '(170, 187, 204)'
  /// ```
  String toRGB() {
    return '($red, $green, $blue)';
  }

  /// Converts a color to a alpha + rgb string
  ///
  /// ```dart
  /// Color(0xFFAABBCC).toARGB() == '(255, 170, 187, 204)'
  /// ```
  String toARGB() {
    return '($alpha, $red, $green, $blue)';
  }

  /// Converts a color to a color name
  ///
  /// Note that this is agnostic to alpha
  ///
  /// ```dart
  /// Color(0xFF000000).toName() == 'white'
  /// ```
  String? toName() {
    return colorValueToName[value | 0xFF000000];
  }
}
