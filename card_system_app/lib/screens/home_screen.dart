import 'package:card_system_app/screens/submission.dart';
import 'package:card_system_app/screens/updates.dart';
import 'package:flutter/material.dart';
import '../Widgets/sideNavBar.dart';
import 'info_screen.dart';

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
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavBar(),
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
      children: const [
        Updates(),
        Submission(),
        Info(),
      ],
    ),
    );
  }
}

