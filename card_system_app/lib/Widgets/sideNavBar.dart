import 'package:card_system_app/resources/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 36, left: 18),
            height: 200,
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/img/logo.png"),
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ref.watch(userProvider).when(data: (String value) {
                      return Text(
                        value.toUpperCase().substring(0, value.indexOf("@")),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      );
                    }, error: (Object e, _) {
                      return Container();
                    }, loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    });
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.only(left: 18),
              height: 46,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black12, offset: Offset(0, 2))
              ]),
              child: const Text('LOG OUT',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
