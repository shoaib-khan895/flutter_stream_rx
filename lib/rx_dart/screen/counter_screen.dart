import 'package:flutter/material.dart';

import '../bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with RxDart')),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.counterStream,
          initialData: counterBloc.currentCount,
          builder: (context, snapshot) {
            return Text(
              'Count: ${snapshot.data}',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  wordSpacing: 2.0),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: '123',
            onPressed: counterBloc.increment,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: '1234',
            onPressed: counterBloc.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }
}
