import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/projects/counter-app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App Using Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CounterProvider>(builder: (context, cp, child) {
            return Text(
              cp.count.toString(),
              style: const TextStyle(
                fontSize: 100,
              ),
            );
          }),
          const SizedBox(
            height: 30,
          ),
          Consumer<CounterProvider>(builder: (context, cp, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    cp.decrement();
                  },
                  child: const Text("Decrement"),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    cp.increment();
                  },
                  child: const Text("Increment"),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
