import 'package:employee_attendance_system/screens/homescreen.dart';
import 'package:employee_attendance_system/screens/loginscreen.dart';
import 'package:employee_attendance_system/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpalashScreen extends StatelessWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // authService.signout();
    return authService.currentUser == null
        ? const LoginScreen()
        : const HomeScreen();
  }
}
