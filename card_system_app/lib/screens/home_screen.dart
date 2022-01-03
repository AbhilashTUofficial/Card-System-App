import 'package:card_system_app/Palette/PageBackground.dart';
import 'package:card_system_app/Palette/constants.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundGradient(),
        Center(
          child: Text(
            'Home page',
            style: labelStyle,
          ),
        )
      ],
    );
  }
}
