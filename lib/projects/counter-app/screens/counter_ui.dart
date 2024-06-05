import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme-change/providers/theme_change_provider.dart';
import '../provider/counter_provider.dart';

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
        actions: [
          (context.read<ThemeChangeProvider>().currentTheme == ThemeMode.dark)
              ? IconButton(
                  onPressed: () {
                    context.read<ThemeChangeProvider>().toggleTheme(false);
                  },
                  icon: const Icon(Icons.light_mode),
                )
              : IconButton(
                  onPressed: () {
                    context.read<ThemeChangeProvider>().toggleTheme(true);
                  },
                  icon: const Icon(Icons.dark_mode),
                )
        ],
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
