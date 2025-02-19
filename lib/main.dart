import 'package:flutter/material.dart';
import 'package:flutter_stream_rx/rx_dart/screen/home_screen.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  // 1️⃣ PublishSubject – Emits only new items to subscribers.

  // 2️⃣ BehaviorSubject – Stores the last emitted value and emits it to new subscribers.
  // 3️⃣ ReplaySubject – Stores a history of emitted values and replays them to new subscribers.

  // 4️⃣ AsyncSubject – Emits only the last value when the stream completes.

  ///PublishSubject.
  // final subject = PublishSubject<int>();
  //
  // subject.listen((value) => print("Listener 1: $value"));
  //
  // subject.add(10);
  //
  // subject.add(20);
  //
  // subject.listen((value) => print("Listener 2: $value"));
  // subject.add(30);

//  subject.close();

  ///BehaviorSubject.
  final subject = BehaviorSubject<int>.seeded(100); // Initial value

  subject.listen((value) => print("Listener 1: $value"));

  subject.add(200);

  subject.listen((value) => print("Listener 2: $value"));
  subject.add(100);
  subject.close();

  ///ReplaySubject.
  // final subject = ReplaySubject<int>();
  //
  // subject.add(1);
  // subject.add(2);
  // subject.add(3);
  //
  // subject.listen((value) => print("Listener: $value"));
  //
  // subject.close();

  // ///AsyncSubject.
  // final subject = AsyncSubject<int>();
  //
  // subject.add(10);
  // subject.add(20);
  // subject.add(30);
  //
  // subject.listen((value) => print("Listener: $value"));
  //
  // subject.close();

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
