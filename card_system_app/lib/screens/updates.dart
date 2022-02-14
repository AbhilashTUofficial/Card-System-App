import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                //pass the update object instead of 0
                return _updateTile(0);
              },
            )),
        itemCount: 4,
      ),
    );
  }
}

Widget _updateTile(items) {
  return Card(
    child: ExpansionTile(
      tilePadding: const EdgeInsets.all(10),
      leading: SizedBox(
        width: 60,
        child: Stack(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/img/profile_img.png"),
              radius: 32,
            ),
            Positioned(
              bottom: 0,left: 2,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      title: const Text("Name"),
      subtitle: const Text("Department"),
      children: const <Widget>[
        ListTile(
          title: Text("Context"),
        )
      ],
    ),
  );
}
