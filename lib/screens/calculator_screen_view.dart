import 'package:flutter/material.dart';

class CalculatorScreenView extends StatefulWidget {
  const CalculatorScreenView({super.key});

  @override
  State<CalculatorScreenView> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreenView> {
  static const List<String> _buttons = [
    'C', '*', '/', '<-',
    '1', '2', '3', '+',
    '4', '5', '6', '-',
    '7', '8', '9', '*',
    '%', '0', '.', '=',
  ];

  String _display = '';
  double _first = 0;
  double _second = 0;
  String _operator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _display.isEmpty ? '0' : _display,
                style: const TextStyle(fontSize: 28, color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: [
                  for (final label in _buttons)
                    ElevatedButton(
                      onPressed: () {
                        if (label == 'C') {
                          setState(() {
                            _display = '';
                            _first = 0;
                            _second = 0;
                            _operator = '';
                          });
                        } else if (label == '<-') {
                          if (_display.isNotEmpty) {
                            setState(() {
                              _display = _display.substring(
                                0,
                                _display.length - 1,
                              );
                            });
                          }
                        } else if ('+-*/%'.contains(label)) {
                          if (_display.isEmpty) return;
                          setState(() {
                            _first = double.tryParse(_display) ?? 0;
                            _operator = label;
                            _display = '';
                          });
                        } else if (label == '=') {
                          if (_display.isEmpty || _operator.isEmpty) return;
                          setState(() {
                            _second = double.tryParse(_display) ?? 0;
                            double result = 0;
                            switch (_operator) {
                              case '+':
                                result = _first + _second;
                                break;
                              case '-':
                                result = _first - _second;
                                break;
                              case '*':
                                result = _first * _second;
                                break;
                              case '/':
                                if (_second == 0) {
                                  _display = 'Error';
                                  _operator = '';
                                  return;
                                }
                                result = _first / _second;
                                break;
                              case '%':
                                result = _first % _second;
                                break;
                            }
                            _display = result % 1 == 0
                                ? result.toInt().toString()
                                : result.toString();
                            _operator = '';
                          });
                        } else {
                          // Prevent multiple decimals in one number
                          if (label == '.' && _display.contains('.')) return;
                          setState(() => _display += label);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(label, style: const TextStyle(fontSize: 28)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}