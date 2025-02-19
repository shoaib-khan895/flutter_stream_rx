import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _counter = BehaviorSubject<int>.seeded(0);

  Stream<int> get counterStream => _counter.stream;

  int get currentCount => _counter.value;

  void increment() => _counter.sink.add(currentCount + 1);

  void decrement() => _counter.sink.add(currentCount - 1);

  void dispose() {
    _counter.close();
  }
}
