import 'package:card_system_app/screens/home_screen.dart';
import 'package:card_system_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardSysApp extends StatelessWidget {
  const CardSysApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: const Color(0xFF398AE5));
    return MaterialApp(

      title: 'card sys app',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          // If Connection is active
          if (snapshot.connectionState == ConnectionState.active) {

            // If snapshot has data
            if (snapshot.hasData) {
              return  const ProviderScope(child: Home());

              // If snapshot has error
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // If Connection is not active but loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          // If Connection is not active and not loading either
          return const LoginScreen();
        },
      ),
    );
  }
}
