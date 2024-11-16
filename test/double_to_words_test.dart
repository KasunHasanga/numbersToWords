import 'package:double_to_words/double_to_words.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  //normal
  test('converts 100 to words', () {
    expect(DoubleToWords.convert(100.00), 'one hundred');
  });

  test('converts 10 to words', () {
    expect(DoubleToWords.convert(10.00), 'ten');
  });
  test('converts 1 to words', () {
    expect(DoubleToWords.convert(1.00), 'one');
  });

  //medium
  test('converts 102 to words', () {
    expect(DoubleToWords.convert(102.00), 'one hundred two');
  });

  //hard
  test('converts 1234.56 to words', () {
    expect(DoubleToWords.convert(1234.56),
        'one thousand two hundred thirty four point fifty six');
  });

  test('converts 0.99 to words', () {
    expect(DoubleToWords.convert(0.99), 'zero point ninety nine');
  });
}
