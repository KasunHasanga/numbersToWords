class NumbersToWords {
  static const _ones = [
    '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
  ];
  static const _teens = [
    'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
    'seventeen', 'eighteen', 'nineteen'
  ];
  static const _tens = [
    '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
  ];
  static const _thousands = ['', 'thousand', 'million', 'billion', 'trillion'];

  static String convert(double number) {
    int wholeNumber = number.floor();
    int decimalPart = ((number - wholeNumber) * 100).round();
    return '${_convertWhole(wholeNumber)} point ${_convertWhole(decimalPart)}';
  }

  static String _convertWhole(int number) {
    if (number == 0) return 'zero';
    int thousandCounter = 0;
    String result = '';
    while (number > 0) {
      if (number % 1000 != 0) {
        result = '${_convertHundreds(number % 1000)} ${_thousands[thousandCounter]} $result';
      }
      number ~/= 1000;
      thousandCounter++;
    }
    return result.trim();
  }

  static String _convertHundreds(int number) {
    if (number < 10) return _ones[number];
    if (number < 20) return _teens[number - 10];
    if (number < 100) return '${_tens[number ~/ 10]} ${_ones[number % 10]}';
    return '${_ones[number ~/ 100]} hundred ${_convertHundreds(number % 100)}';
  }
}
