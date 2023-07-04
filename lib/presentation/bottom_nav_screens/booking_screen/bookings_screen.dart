import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/booking_screen/tab_bars/bookings.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/booking_screen/tab_bars/test_drive.dart';

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
        centerTitle: true,
        title: const Text(
          "Admin",
        ),
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
