import 'dart:math';

import 'package:flutter_stream_rx/stream/screen.dart';

class Operations {
  void add() {
    // Generate a random number between 0 and 100 (inclusive).
    final randomNumber = Random().nextInt(101);

    // Add the generated random number to the stream controller.
    controller.add(randomNumber);
  }
}
