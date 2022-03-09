import 'package:card_system_app/Widgets/viewHistory.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  child: const Center(
                    child: TextField(
                      // controller: textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _historyTile(context,index);
            },
          ),
        ],
      ),
    );
  }
}

Widget _historyTile(BuildContext context,regNo) {
  return Card(
    child: ExpansionTile(
      tilePadding: const EdgeInsets.all(10),
      // Circular Avatar and Card indicator
      //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      leading: const SizedBox(
        width: 60,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/img/profile_img.png"),
          radius: 32,
        ),
      ),
      //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      title: const Text("Name"),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Department"),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(color: Colors.amber),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(color: Colors.blueAccent),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Course : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              Text(
                "Register number : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              Text(
                "Batch : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              Text(
                "Phone number : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              Text(
                "Address : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        ListTile(
          title: GestureDetector(
            child: const Text(
              "View History",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ViewHistory();
                },
              );

            },
          ),
        )
      ],
    ),
  );
}
