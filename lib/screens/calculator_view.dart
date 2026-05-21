import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/calculator_model.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorModel _calculator = CalculatorModel();

  final List<String> buttonNames = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  void _handleButtonPress(String btnLabel) {
    setState(() {
      if (btnLabel == 'C') {
        _calculator.clear();
      } else if (btnLabel == '<-') {
        _calculator.backspace();
      } else if (btnLabel == '=') {
        _calculator.calculate();
      } else if ('+-*/%'.contains(btnLabel)) {
        _calculator.setOperator(btnLabel);
      } else if (btnLabel.isNotEmpty) {
        _calculator.addValue(btnLabel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),centerTitle: true,
        backgroundColor: Colors.blue,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _calculator.display,
                style: const TextStyle(fontSize: 28, color: Colors.black),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: buttonNames.map((btnLabel) {
                  if (btnLabel.isEmpty) {
                    return const SizedBox();
                  }

                  return ElevatedButton(
                    onPressed: () => _handleButtonPress(btnLabel),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(btnLabel, style: const TextStyle(fontSize: 28)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}