import 'package:color_tools/color_tools.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const baseColor = Color(0xAA998877);
  final baseColorHSL = HSLColor.fromColor(baseColor);
  final baseColorHSV = HSVColor.fromColor(baseColor);

  test('test ligthen', () {
    expect(baseColor.lighten(0.1),
        baseColorHSL.withLightness(baseColorHSL.lightness + 0.1).toColor());
    expect(baseColor.lighten(10), baseColorHSL.withLightness(1).toColor());
    expect(baseColor.lighten(-10), baseColorHSL.withLightness(0).toColor());
  });

  test('test darken', () {
    expect(baseColor.darken(0.1),
        baseColorHSL.withLightness(baseColorHSL.lightness - 0.1).toColor());
    expect(baseColor.darken(10), baseColorHSL.withLightness(0).toColor());
    expect(baseColor.darken(-10), baseColorHSL.withLightness(1).toColor());
  });

  test('test saturate', () {
    expect(baseColor.saturate(0.1),
        baseColorHSV.withSaturation(baseColorHSV.saturation + 0.1).toColor());
    expect(baseColor.saturate(10), baseColorHSV.withSaturation(1).toColor());
    expect(baseColor.saturate(-10), baseColorHSV.withSaturation(0).toColor());
  });

  test('test desaturate', () {
    expect(baseColor.desaturate(0.1),
        baseColorHSV.withSaturation(baseColorHSV.saturation - 0.1).toColor());
    expect(baseColor.desaturate(10), baseColorHSV.withSaturation(0).toColor());
    expect(baseColor.desaturate(-10), baseColorHSV.withSaturation(1).toColor());
  });
}
