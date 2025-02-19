import 'package:flutter/material.dart';

import '../bloc/auth_bloc.dart';
import '../model/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthBloc authBloc = AuthBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login with RxDart')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<User?>(
              stream: authBloc.userStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Column(
                    children: [
                      Text("Welcome, ${snapshot.data!.name}",
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: authBloc.logout,
                        child: Text("Logout"),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.login(
                            emailController.text, passwordController.text);
                      },
                      child: Text("Login"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
