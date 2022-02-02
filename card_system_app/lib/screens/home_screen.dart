import 'package:card_system_app/Palette/PageBackground.dart';
import 'package:card_system_app/Palette/constants.dart';
import 'package:card_system_app/resources/auth_methods.dart';
import 'package:card_system_app/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String user=' ';

  @override
  void initState(){
    super.initState();
  }
  Future<void>getUserDetails()async{
    User currentUser=_auth.currentUser!;

    DocumentSnapshot snap =await _firestore.collection("users").doc(currentUser.uid).get();

    print(currentUser.email);

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        const BackgroundGradient(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Home page',
                style: labelStyle,
              ),
              GestureDetector(
                onTap: ()async{
                  await AuthMethods().signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));
                },
                child: const Text(
                  'Sign Out',
                  style: labelStyle,
                ),
              ),
              GestureDetector(
                onTap: (){
                  print(user);
                },
                child: const Text(
                  'User details',
                  style: labelStyle,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
