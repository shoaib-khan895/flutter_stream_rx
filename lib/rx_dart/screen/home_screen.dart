import 'package:flutter/material.dart';

import 'counter_screen.dart';
import 'login_screen.dart';

final ButtonStyle buttonStyle = ButtonStyle(
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  )),
  textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15)),
  padding: WidgetStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  ),
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RxDart Example'),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.blue[200]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CounterScreen()));
                },
                child: const Text(
                  "Counter Screen",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      wordSpacing: 2.0),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: const Text(
                  "Login Screen",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
