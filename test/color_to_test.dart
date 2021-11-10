import 'package:colorful/colorful.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util.dart';

void main() {
  test('test color to code', () {
    expect(red.toCode(), redCode);
    expect(darkPurple.toCode(), darkPurpleCode);
  });

  test('test color to ARGB', () {
    expect(red.toARGB(), redPurpleARGB);
    expect(darkPurple.toARGB(), darkPurpleARGB);
  });
  test('test color to RGB', () {
    expect(red.toRGB(), redPurpleRGB);
    expect(darkPurple.toRGB(), darkPurpleRGB);
  });

  test('test color to name', () {
    expect(red.toName(), 'red');
  });

  test('test color roundtrip', () {
    expect(ColorFrom.name('red')!.toName(), 'red');
  });

  test('test color to toCodeWithAlpha', () {
    expect(darkPurple.toCodeWithAlpha(), darkPurpleCodeWithAlpha);
  });
}
