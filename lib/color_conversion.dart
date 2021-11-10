import 'package:flutter/painting.dart';

extension ColorBrightness on Color {
  Color lighten([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color darken([double amount = .1]) {
    return lighten(-amount);
  }

  Color saturate([double amount = .1]) {
    final hsv = HSVColor.fromColor(this);
    return hsv
        .withSaturation((hsv.saturation + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color desaturate([double amount = .1]) {
    return saturate(-amount);
  }
}
