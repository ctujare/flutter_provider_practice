import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/projects/example-one/providers/example-one-provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double val = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example One"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, eop, _) {
            return Slider(
              value: eop.sliderVal,
              onChanged: (value) {
                eop.sliderVal = value;
              },
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Consumer<ExampleOneProvider>(builder: (context, eop, _) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(eop.sliderVal),
                    ),
                  );
                }),
              ),
              Expanded(
                child: Consumer<ExampleOneProvider>(builder: (context, eop, _) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(eop.sliderVal)),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
