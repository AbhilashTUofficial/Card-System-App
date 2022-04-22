import 'package:card_system_app/Palette/PageBackground.dart';
import 'package:card_system_app/Palette/constants.dart';
import 'package:card_system_app/resources/auth_methods.dart';
import 'package:card_system_app/screens/login_screen.dart';
import 'package:card_system_app/screens/submission.dart';
import 'package:card_system_app/screens/updates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'info_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              accountEmail: null,
              accountName: null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("NCAS Card System"),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "UPDATES"),
            Tab(text: "SUBMISSION"),
            Tab(text: "INFO"),
          ],
        ),
      ),
      body: TabBarView(
      controller: _tabController,
      children: [
        Updates(),
        Submission(),
        Info(),

      ],
    ),
    );
  }
}

