import 'dart:isolate';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolatedTaskScreen extends StatefulWidget {
  const IsolatedTaskScreen({Key? key}) : super(key: key);

  @override
  State<IsolatedTaskScreen> createState() => _IsolatedTaskScreenState();
}

class _IsolatedTaskScreenState extends State<IsolatedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Isolated Task"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();

                  await Isolate.spawn(
                      _calculateHeavyTask, receivePort.sendPort);
                },
                child: const Text("Calculate With Isolated")),
            ElevatedButton(
                onPressed: () => _calculateSimple(1000000000),
                child: const Text("Simple Calculate")),
          ],
        ),
      ),
    );
  }

  void _calculateSimple(int value) {
    int sum = 0;
    print("Start");
    for (int i = 0; i < value; i++) {
      sum += i;
    }
    print("End $sum");
  }
}

void _calculateHeavyTask(SendPort sendPort) {
  int sum = 0;
  print("Start");
  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }
  print("End $sum");
}

