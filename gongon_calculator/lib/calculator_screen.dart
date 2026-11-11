import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final fname = TextEditingController();
  final sname = TextEditingController();

  String result = '0';
  String label = 'enter 2 numbers';

  void calculate(String operation) {
    setState(() {
      final first = double.tryParse(fname.text.trim());
      final second = double.tryParse(sname.text.trim());

      if (first == null ||
          second == null ||
          !first.isFinite ||
          !second.isFinite) {
        result = 'Invalid input';
        label = 'Please enter valid numbers';
        return;
      }

      if (operation == '÷' && second == 0) {
        result = 'Error';
        label = 'Cannot divide by zero';
        return;
      }

      double calculation;

      switch (operation) {
        case '+':
          calculation = first + second;
          break;
        case '-':
          calculation = first - second;
          break;
        case '×':
          calculation = first * second;
          break;
        case '÷':
          calculation = first / second;
          break;
        default:
          calculation = 0;
      }

      result = calculation.toString();
      label = 'Result: ${fname.text.trim()} $operation '
          '${sname.text.trim()} = $result';
    });
  }

  void clearCalculator() {
    fname.clear();
    sname.clear();

    setState(() {
      result = '0';
      label = 'Enter two numbers';
    });
  }

  @override
  void dispose() {
    fname.dispose();
    sname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stateful Calculator'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.calculate, size: 64, color: Colors.indigo),
            const SizedBox(height: 12),

            const Text(
              'BASIC CALCULATOR',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: fname,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'First Number',
                hintText: 'Enter the first number',
                prefixIcon: Icon(Icons.looks_one),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: sname,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Second Number',
                hintText: 'Enter the second number',
                prefixIcon: Icon(Icons.looks_two),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text('−', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('×'),
                  child: const Text('×', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('÷'),
                  child: const Text('÷', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.indigo),
              ),
              child: Column(
                children: [
                  Text(label, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  const Text(
                    'RESULT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: clearCalculator,
              icon: const Icon(Icons.refresh),
              label: const Text('Clear'),
            ),
            const SizedBox(height: 24),

            const Text(
              'Created by: GABRIEL GONGON\nCCE106: 3450',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
