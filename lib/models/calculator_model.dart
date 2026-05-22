class CalculatorModel {
  String _display = '';
  String _firstNumber = '';
  String _operator = '';

  String get display => _display;

  // Add number or dot
  void addValue(String value) {
    _display += value;
  }

  // Clear everything
  void clear() {
    _display = '';
    _firstNumber = '';
    _operator = '';
  }

  // Remove last character
  void backspace() {
    if (_display.isNotEmpty) {
      _display = _display.substring(0, _display.length - 1);
    }
  }

  // // Store operator
  // void setOperator(String op) {
  //   if (_display.isNotEmpty) {
  //     _firstNumber = _display;
  //     _operator = op;
  //     _display = '';
  //   }
  // }

  // Store operator
  void setOperator(String op) {
    // If the user presses an operator first, default the first number to '0'
    if (_display.isEmpty) {
      _firstNumber = '0';
      _operator = op;
      return; // Stop here and wait for the second number
    }

    // Normal behavior if a number was already typed
    _firstNumber = _display;
    _operator = op;
    _display = '';
  }

  // Calculate result
  void calculate() {
    if (_firstNumber.isEmpty || _display.isEmpty || _operator.isEmpty) return;

    double num1 = double.parse(_firstNumber);
    double num2 = double.parse(_display);
    double result = 0;

    switch (_operator) {
      case '+':
        result = num1 + num2;
        break;

      case '-':
        result = num1 - num2;
        break;

      case '*':
        result = num1 * num2;
        break;

      case '/':
        if (num2 != 0) {
          result = num1 / num2;
        } else {
          _display = 'Error';
          return;
        }
        break;

      case '%':
        result = num1 % num2;
        break;
    }

    // Remove .0 if integer
    if (result == result.toInt()) {
      _display = result.toInt().toString();
    } else {
      _display = result.toString();
    }

    _firstNumber = '';
    _operator = '';
  }
}
