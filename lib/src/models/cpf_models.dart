import 'dart:math';

class CpfModel {
  var _random = Random();
  final String _value;
  late final String _valueWithMask;
  late List<int> _digits;
  final int _firstIndexDigit = 9;
  final int _secondIndexDigit = 10; 

  CpfModel(this._value){
    _valueWithMask = _cleanMask();
    _digits = _convertValueListDigits(_valueWithMask);
  }

  List<int> _convertValueListDigits(String value) {
   return value.split('').map(int.parse).toList();
  }

  String _cleanMask() {
    return _value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  int _getDigitValue(int index) {
    return _digits[index];
  }

  int _getValidatorDigit(int index) {
    var digit = 0;
    var digitIndex = 0;
    for (var i = index; i >= 2; i--) {
      digit += _digits[digitIndex] * i;
      digitIndex++;
    }

    digit = digit % 11;
    digit = digit < 2 ? 0 : 11 - digit;

    return digit;
  }

  int _calculateDigit(int ponderosity) {
    var digit = 0;
    var digitIndex = 0;
    var multiply = ponderosity;
    for (var i = _digits.length; i >= 1; i--) {
      digit += _digits[digitIndex] * multiply;
      digitIndex++;
      multiply = multiply - 1;
    }

    digit = digit % 11;
    digit = digit < 2 ? 0 : 11 - digit;

    return digit;
  }

  bool isValid() {
    final bool isValidLength = (_digits.length == 11);
    final bool isAllDigitsNotEqual = !(_digits.toSet().length == 1);
    final bool isValidFirstDigit = (_getDigitValue(_firstIndexDigit) == _getValidatorDigit(10));
    final bool isValidSecondDigit = (_getDigitValue(_secondIndexDigit) == _getValidatorDigit(11));

    final bool isValid = 
      isValidLength 
      && isValidFirstDigit 
      && isValidSecondDigit 
      && isAllDigitsNotEqual;

    return isValid;
  }

  int _randomNumber() {
    return _random.nextInt(10);
  }

  int _calculateFirstDigit() {
    return _calculateDigit(10);
  }

  int _calculateSecondDigit() {
    return _calculateDigit(11);
  }

  String createCpf() {
    String value = ''; 

    for (var i = 0; i < 9; i++) {
      value += _randomNumber().toString();
    }

    _digits = _convertValueListDigits(value);
    value += _calculateFirstDigit().toString();
    _digits = _convertValueListDigits(value);
    value += _calculateSecondDigit().toString();

    return value;
  }
}