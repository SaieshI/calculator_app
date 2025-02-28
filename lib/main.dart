import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String display = '';

  void buttonPressed(String value) {
    setState(() {
      display = display + value;
    });
  }

  void clearDisplay() {
    setState(() {
      display = '';
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: InkWell(
        onTap: () => buttonPressed(text),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.orange, 
            borderRadius: BorderRadius.circular(10), 
          ),
          child: Center(
            child: Text(
              text, 
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              display,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(children: [buildButton('7'), buildButton('8'), buildButton('9'), buildButton('/')]), 
              Row(children: [buildButton('4'), buildButton('5'), buildButton('6'), buildButton('*')]),
              Row(children: [buildButton('1'), buildButton('2'), buildButton('3'), buildButton('-')]),
              Row(children: [buildButton('0'), buildButton('+')]),
            ],
          ),
        ],
      ),
    );
  }
}
