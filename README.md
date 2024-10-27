
# NumbersToWords

A simple Dart package for converting double numbers to their word representation. Useful for creating more readable representations of numbers in apps, documents, and educational materials!

## Features

-   Converts whole and decimal parts of double numbers into words.
-   Handles numbers up to trillions.
-   Custom handling for numbers ending in `.00`, omitting unnecessary "point zero zero."

## Installation

Add this to your `pubspec.yaml`:

yaml

    dependencies:
	  double_to_words: ^1.0.0

Then run:

    flutter pub get

## Usage

dart

    import 'package:double_to_words/double_to_words.dart';
    
    void main() {
      print(DoubleToWords.convert(102.00));      // Outputs: "one hundred two"
      print(DoubleToWords.convert(1234.56));     // Outputs: "one thousand two hundred thirty-four point fifty-six"
      print(DoubleToWords.convert(0.99));        // Outputs: "zero point ninety-nine"
    }

## Example

Convert any double number into its word format:

dart


    double amount = 2045.75;
    String words = DoubleToWords.convert(amount);
    print(words); // "two thousand forty-five point seventy-five"` 

## Testing

Run the tests to verify functionality:

bash

`flutter test`

## License

This project is licensed under the MIT License.