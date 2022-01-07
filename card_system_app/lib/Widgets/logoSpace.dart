import 'package:flutter/material.dart';

class LogoSpace extends StatelessWidget {
  const LogoSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage("assets/img/logo.png"),
    );
  }
}
