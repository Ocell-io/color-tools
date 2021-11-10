import 'package:color_tools/color_tools.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util.dart';

void main() {
  test('test color from name', () {
    expect(ColorFrom.name("red"), equals(red));
  });

  test('test color from code w alpha', () {
    expect(ColorFrom.code(redCodeAlpha), equals(red));
  });

  test('test color from code', () {
    expect(ColorFrom.code(redCode), equals(red));
  });

  test('test color from noAlpha', () {
    expect(ColorFrom.noAlpha(0xff0000), equals(red));
  });

  test('test color from noAlpha', () {
    expect(ColorFrom.string("red"), equals(red));
    expect(ColorFrom.string(redCode), equals(red));
  });

  test('test color from object', () {
    const someObject = "does not have to be a string!";

    expect(ColorFrom.object(someObject), equals(ColorFrom.object(someObject)));
    expect(
        ColorFrom.object(someObject,
            valueLowerLimit: 1, saturationUpperLimit: 1),
        equals(ColorFrom.object(someObject,
            valueLowerLimit: 1, saturationUpperLimit: 1)));
    expect(
        ColorFrom.object(someObject,
            hueLowerLimit: 40, valueLowerLimit: 1, saturationUpperLimit: 1),
        equals(ColorFrom.object(someObject,
            hueLowerLimit: 40, valueLowerLimit: 1, saturationUpperLimit: 1)));
  });
}
