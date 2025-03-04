import 'package:flutter/material.dart';

import '../bloc/auth_bloc.dart';
import '../model/user.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthBloc authBloc = AuthBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login with RxDart')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            StreamBuilder<User?>(
              stream: authBloc.userStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("Welcome, ${snapshot.data!.email}",
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: buttonStyle,
                            onPressed: authBloc.logout,
                            child: Text("Logout"),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => value!.isEmpty
                            ? 'Email cannot be empty'
                            : authBloc.validateEmail(value)
                                ? null
                                : 'Invalid email',
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => value!.isEmpty
                            ? 'Password cannot be empty'
                            : authBloc.validatePassword(value)
                                ? null
                                : 'Invalid password',
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authBloc.login(
                                emailController.text, passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid form"),
                              ),
                            );
                          }
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
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
