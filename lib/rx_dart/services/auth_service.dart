import 'package:flutter_stream_rx/rx_dart/model/user.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    // await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return User(id: '1', name: 'John Doe', email: email);
  }
}
