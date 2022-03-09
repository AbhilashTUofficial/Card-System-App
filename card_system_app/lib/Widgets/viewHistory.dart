import 'package:flutter/material.dart';

class ViewHistory extends StatelessWidget {
  const ViewHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .86,
        height: MediaQuery.of(context).size.height * .86,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 18),
            ),

          ],
        ),
      ),
    );
  }
}
