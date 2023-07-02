import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nexon_ev_admin/controller/providers/bookings_provider.dart';
import 'package:nexon_ev_admin/presentation/tab_bars/test_drive.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<TestDriveProvider>(context, listen: false)
        .bookingsData(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "admin",
        ),
        bottom: TabBar(
            controller: _tabController,
            tabs: const [Text("Bookings"), Text("Test Drive")]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [TestDrive(), Text("data")]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GNav(
            rippleColor: Colors.grey,
            hoverColor: Colors.grey,
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.purple,
            iconSize: 24,
            tabBackgroundColor: Colors.purple.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), //

            tabs: const [
              GButton(
                icon: Icons.bookmark_outlined,
                text: "Bookings",
              ),
              GButton(
                icon: Icons.supervised_user_circle_outlined,
                text: "User",
              )
            ]),
      ),
    );
  }
}
