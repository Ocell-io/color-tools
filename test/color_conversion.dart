import 'package:colorful/colorful.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const baseColor = Color(0xA17d4040);
  final baseColorHSL = HSLColor.fromColor(baseColor);

  test('test ligthen', () {
    expect(baseColor.lighten(0.1),
        baseColorHSL.withLightness(baseColorHSL.lightness + 0.1));
    expect(baseColor.lighten(10), baseColorHSL.withLightness(1));
    expect(baseColor.lighten(-10), baseColorHSL.withLightness(0));
  });

  test('test darken', () {
    expect(baseColor.darken(0.1),
        baseColorHSL.withLightness(baseColorHSL.saturation - 0.1));
    expect(baseColor.darken(10), baseColorHSL.withLightness(0));
    expect(baseColor.darken(-10), baseColorHSL.withLightness(1));
  });

  test('test saturate', () {
    expect(baseColor.saturate(0.1),
        baseColorHSL.withLightness(baseColorHSL.saturation + 0.1));
    expect(baseColor.saturate(10), baseColorHSL.withSaturation(1));
    expect(baseColor.saturate(-10), baseColorHSL.withSaturation(0));
  });

  test('test desaturate', () {
    expect(baseColor.desaturate(0.1),
        baseColorHSL.withLightness(baseColorHSL.saturation - 0.1));
    expect(baseColor.desaturate(10), baseColorHSL.withSaturation(0));
    expect(baseColor.desaturate(-10), baseColorHSL.withSaturation(1));
  });
}
