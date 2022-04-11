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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
  return const Card(
    child: ExpansionTile(
      tilePadding: EdgeInsets.all(10),
      leading: SizedBox(
        child: CircleAvatar(
          // backgroundImage:
          // AssetImage(contactList[index].imgUrl),
          radius: 32,
        ),
      ),
      title: Text("Name"),
      subtitle: Text("Department"),
      children: <Widget>[
        ListTile(
          title: Text("Context"),
        )
      ],
    ),
  );
}
