import 'package:flutter_stream_rx/rx_dart/model/user.dart';
import 'package:flutter_stream_rx/rx_dart/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

/// A BLoC (Business Logic Component) for handling authentication.
///
/// This class manages the authentication state and provides streams
/// to listen to the current user state.
class AuthBloc {
  final _authService = AuthService();
  final _userSubject = BehaviorSubject<User?>();

  /// A stream that emits the current user state.
  ///
  /// Emits a [User] object when the user is logged in, and `null` when the user is logged out.
  Stream<User?> get userStream => _userSubject.stream;

  /// Logs in a user with the given [email] and [password].
  ///
  /// This method calls the [AuthService.login] method and updates the user stream
  /// with the logged-in user.
  ///
  /// \param email The email of the user.
  /// \param password The password of the user.
  /// \returns A [Future] that completes when the login process is done.
  Future login(String email, String password) async {
    final user = await _authService.login(email, password);
    _userSubject.add(user);
  }

  /// Logs out the current user.
  ///
  /// This method updates the user stream with `null`, indicating that the user is logged out.
  void logout() {
    _userSubject.add(null);
  }

  /// Disposes the BLoC by closing the user stream.
  ///
  /// This method should be called when the BLoC is no longer needed to release resources.
  void dispose() {
    _userSubject.close();
  }
}
// class AuthBloc {
//   final _authService = AuthService();
//   final _userSubject = BehaviorSubject<User?>();
//
//   Stream<User?> get userStream => _userSubject.stream;
//
//   Future login(String email, String password) async {
//     final user = await _authService.login(email, password);
//     _userSubject.add(user);
//   }
//
//   void logout() {
//     _userSubject.add(null);
//   }
//
//   void dispose() {
//     _userSubject.close();
//   }
// }
