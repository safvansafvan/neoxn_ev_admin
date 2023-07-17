import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/loginprovider.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/booking_screen/tab_bars/bookings.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/booking_screen/tab_bars/test_drive.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu)),
        centerTitle: true,
        title: const Text(
          "Admin",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<LoginProvider>(context, listen: false)
                  .logout(context);
            },
            tooltip: "Logout",
            icon: const Icon(Icons.logout_outlined),
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: const [Text("Bookings"), Text("Test Drive")]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [Bookings(), TestDrive()]),
    );
  }
}
