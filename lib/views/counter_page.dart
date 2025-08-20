import 'package:flutter/material.dart';
import 'package:my_app/models/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Counter with Provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Current Count:", style: TextStyle(fontSize: 20)),
            Text(
              "${counterProvider.count}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counterProvider.increment,
                  child: const Text("+"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: counterProvider.decrement,
                  child: const Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
