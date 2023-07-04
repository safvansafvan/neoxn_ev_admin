import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/user_dealer_screen/tabbar/dealer.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_screens/user_dealer_screen/tabbar/users.dart';

class UserAndDealerScreen extends StatefulWidget {
  const UserAndDealerScreen({super.key});

  @override
  State<UserAndDealerScreen> createState() => _UserAndDealerScreenState();
}

class _UserAndDealerScreenState extends State<UserAndDealerScreen>
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
            tabs: const [Text("Users"), Text("Dealers")]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [UsersWidget(), DealersWidget()]),
    );
  }
}
