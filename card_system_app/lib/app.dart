import 'package:card_system_app/resources/models/writeToFile.dart';
import 'package:card_system_app/screens/home_screen.dart';
import 'package:card_system_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CardSysApp extends StatelessWidget {
  const CardSysApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: const Color(0xFF398AE5));
    return MaterialApp(

      title: 'card sys app',
      debugShowCheckedModeBanner: false,
      // home:SignupScreen()
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              userCredWriteToFile();
              return  Home();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
