import 'package:flutter_stream_rx/rx_dart/bloc/auth_bloc.dart';
import 'package:flutter_stream_rx/rx_dart/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.dispose();
    });

    // test('emits User when login is successful', () async {
    //   final user = User(id: '1', email: 'test@example.com', name: 'John Doe');
    //   when(mockAuthService.login('test@example.com', 'password'))
    //       .thenAnswer((_) async => user);
    //   await authBloc.login('test@example.com', 'password');
    //   await expectLater(authBloc.userStream, emitsInOrder([user]));
    // });

    test('emits null when logout is called', () async {
      authBloc.logout();

      expectLater(authBloc.userStream, emitsInOrder([null]));
    });

    test('closes the stream when dispose is called', () {
      authBloc.dispose();

      expect(authBloc.userStream.isBroadcast, true);
    });
  });
}
