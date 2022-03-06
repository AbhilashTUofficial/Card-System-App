import 'package:card_system_app/Widgets/cardsInfo.dart';
import 'package:card_system_app/screens/history_screen.dart';
import 'package:card_system_app/screens/submission_screen.dart';
import 'package:card_system_app/screens/updates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widgets/sideNavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// Controllers
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("NCAS Card System"),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CardsInfo();
                },
              );
            },
          )
        ],

        // Tabs
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "UPDATES"),
            Tab(text: "SUBMISSION"),
            Tab(text: "HISTORY"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Updates(),
          SingleChildScrollView(child: Submission()),
          SingleChildScrollView(child: History()),
        ],
      ),
    );
  }
}
