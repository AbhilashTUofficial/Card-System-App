import 'package:card_system_app/screens/login_screen.dart';
import 'package:card_system_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class CardSysApp extends StatelessWidget {
  const CardSysApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        // home:SignupScreen()
      home: LoginScreen(),
    );
  }
}
