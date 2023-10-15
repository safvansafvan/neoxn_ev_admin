import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/presentation/add_dealer/add_dealer.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_items/user_dealer_screen/tabbar/dealer.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_items/user_dealer_screen/tabbar/users.dart';

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
        leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu)),
        centerTitle: true,
        title: const Text(
          "Admin",
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDealerScreen(),
                  ),
                );
              },
              tooltip: "Add Dealer",
              icon: const Icon(Icons.add_box_outlined))
        ],
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
