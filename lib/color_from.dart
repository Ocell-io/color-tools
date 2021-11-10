import 'dart:math';

import 'package:color_tools/color_tabels.dart';
import 'package:flutter/painting.dart';

extension ColorFrom on Color {
  /// Get color from a int value without alpha
  ///
  /// ```dart
  /// ColorFrom.noAlpha(0xAABBCC) == Color(0xFFAABBCC)
  /// ```
  static Color noAlpha(int value) {
    return Color(0xff000000 | value);
  }

  /// Get color from a color name
  ///
  /// ```dart
  /// ColorFrom.fromName('red') == Color(0xFFFF0000)
  /// ```
  static Color? name(String name) {
    final data = colorNameToValue[name.toLowerCase()];
    return data != null ? Color(data) : null;
  }

  /// Get color a from a color code
  ///
  /// ```dart
  /// ColorFrom.code('#AABBCC') == Color(0xFFAABBCC)
  /// ColorFrom.code('#11AABBCC') == Color(0x11AABBCC)
  /// ```
  static Color code(String string) {
    assert(string.startsWith('#'), "hash string must start with #");
    final numbers = string.substring(1);
    final data = int.parse(numbers, radix: 16);
    if (numbers.length == 6) return Color(0xff000000 | data);
    return Color(data);
  }

  /// Try to get a color by name or code
  ///
  /// ```dart
  /// ColorFrom.string('red') == Color(0xFFFF0000)
  /// ColorFrom.string('#FF0000') == Color(0xFFFF0000)
  /// ```
  static Color? string(String string) {
    if (string.startsWith("#")) return ColorFrom.code(string);
    return ColorFrom.name(string);
  }

  /// Covert a object(hash) to a color
  ///
  /// The Color is deterministic and fully defind by the hash of the [object].
  /// The limits can be used to set the desired range of the output colors.
  /// By default all colors are possible
  ///
  ///
  /// [hueUpperLimit] and [hueLowerLimit] set the range of possible hues the
  /// value range is 0 to 360
  ///
  /// [saturationUpperLimit] and [saturationLowerLimit] set the range of
  /// possible saturations the value range is 0 to 1
  ///
  /// [valueUpperLimit] and [valueUpperLimit] set the range of
  /// possible values the value range is 0 to 1
  ///
  /// ```dart
  /// ColorFrom.object('some object')
  /// // it is deterministic!
  /// ColorFrom.object('a') == ColorFrom.object('a')
  /// ```
  static Color object(
    Object object, {
    final double hueUpperLimit = 360,
    final double hueLowerLimit = 0,
    final double saturationUpperLimit = 1,
    final double saturationLowerLimit = 0,
    final double valueUpperLimit = 1,
    final double valueLowerLimit = 0,
  }) {
    assert(hueUpperLimit <= 360);
    assert(hueUpperLimit >= 0);
    assert(hueLowerLimit <= 360);
    assert(hueLowerLimit >= 0);

    assert(saturationUpperLimit <= 1);
    assert(saturationUpperLimit >= 0);
    assert(saturationLowerLimit <= 1);
    assert(saturationLowerLimit >= 0);

    assert(valueUpperLimit <= 1);
    assert(valueUpperLimit >= 0);
    assert(valueLowerLimit <= 1);
    assert(valueLowerLimit >= 0);

    final random = Random(object.hashCode);
    final hue =
        random.nextDouble() * (hueUpperLimit - hueLowerLimit) + hueLowerLimit;
    final saturation =
        random.nextDouble() * (saturationUpperLimit - saturationLowerLimit) +
            saturationLowerLimit;
    final value = random.nextDouble() * (valueUpperLimit - valueLowerLimit) +
        valueLowerLimit;
    return HSVColor.fromAHSV(1, hue, saturation, value).toColor();
  }
}
