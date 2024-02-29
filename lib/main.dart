import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart'; // Import your login page here
import 'dashboard_page.dart'; // Import your dashboard page here

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool isAuthenticated = false; // Simulated authentication status

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? DashboardPage() : LoginPage();
  }
}
