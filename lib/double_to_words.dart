/// A utility class for converting double numbers into their word representation.
///
/// This class handles conversion of both the whole number and decimal parts
/// of a double value into words. For example:
///
/// ```dart
/// final words = DoubleToWords.convert(123.45);
/// print(words); // Outputs: "one hundred twenty-three point forty-five"
/// ```
class DoubleToWords {
  /// Words for numbers from 0 to 9.
  static const _ones = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];

  /// Words for numbers from 10 to 19.
  static const _teens = [
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ];

  /// Words for tens multiples from 20 to 90.
  static const _tens = [
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety'
  ];

  /// Words for thousand, million, billion, etc.
  static const _thousands = ['', 'thousand', 'million', 'billion', 'trillion'];

  /// Converts a [double] value into its corresponding word representation.
  ///
  /// - [number]: The double value to be converted.
  /// - Returns a [String] that represents the number in words.
  ///
  /// Example:
  /// ```dart
  /// final result = DoubleToWords.convert(1234.56);
  /// print(result); // "one thousand two hundred thirty-four point fifty-six"
  /// ```
  static String convert(double number) {
    int wholeNumber = number.floor();
    int decimalPart = ((number - wholeNumber) * 100).round();

    // Check if the decimal part is zero, omit "point zero zero" if so
    if (decimalPart == 0) {
      return _convertWhole(wholeNumber);
    } else {
      return '${_convertWhole(wholeNumber)} point ${_convertWhole(decimalPart)}';
    }
  }

  /// Converts an integer part of a number into words.
  ///
  /// - [number]: The integer value to be converted.
  /// - Returns a [String] representing the integer part in words.
  static String _convertWhole(int number) {
    if (number == 0) return 'zero';
    int thousandCounter = 0;
    String result = '';
    while (number > 0) {
      if (number % 1000 != 0) {
        result =
        '${_convertHundreds(number % 1000)} ${_thousands[thousandCounter]} $result';
      }
      number ~/= 1000;
      thousandCounter++;
    }
    return result.trim();
  }

  /// Converts a number less than 1000 into words.
  ///
  /// - [number]: An integer less than 1000.
  /// - Returns a [String] representing the number in words.
  static String _convertHundreds(int number) {
    if (number < 10) return _ones[number];
    if (number < 20) return _teens[number - 10];
    if (number < 100) return '${_tens[number ~/ 10]} ${_ones[number % 10]}';
    return '${_ones[number ~/ 100]} hundred ${_convertHundreds(number % 100)}';
  }
}
