import 'dart:async';

import 'package:flutter/material.dart';

import 'operations.dart';

StreamController<int> controller = StreamController<int>();
Stream stream = controller.stream;
Operations _operations = Operations();

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                StreamBuilder(
                  stream: controller.stream,
                  initialData: '',
                  builder: (context, snapshot) {
                    return Text(
                      'Value from Stream: ${snapshot.data}',
                      style: const TextStyle(fontSize: 24),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _operations.add();
                  },
                  child: const Text('update value'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
