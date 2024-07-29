import 'package:flutter/material.dart';
import 'package:gw_sorting/Screens/Authentication/Views/LoginView.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginView(),
    );
  }
}
