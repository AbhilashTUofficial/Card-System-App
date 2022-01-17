import 'package:card_system_app/Palette/PageBackground.dart';
import 'package:card_system_app/Palette/constants.dart';
import 'package:card_system_app/resources/auth_methods.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                },
                child: const Text(
                  'Sign Out',
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
