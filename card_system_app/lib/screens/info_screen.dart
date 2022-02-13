import 'package:flutter/material.dart';
import '../Widgets/infoCard.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            InfoCard(cardColor: Colors.redAccent),
            InfoCard(cardColor: Colors.amberAccent),
            InfoCard(cardColor: Colors.blueAccent),
            InfoCard(cardColor: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}
