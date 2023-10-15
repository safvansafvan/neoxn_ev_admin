import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_dashbord_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_dealer_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_users_provider.dart';
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_items/booking_screen/bookings_screen.dart';
import 'package:nexon_ev_admin/presentation/bottom_nav_items/user_dealer_screen/user_dealer_screen.dart';
import 'package:nexon_ev_admin/presentation/widget/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screen = const [BookingScreen(), UserAndDealerScreen()];
  int currentInd = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<TestDriveProvider>(context, listen: false)
        .testDriveBookingData(context);
    Provider.of<BookingProvider>(context, listen: false).bookingsData(context);
    Provider.of<UsersProvider>(context, listen: false).fetchUsers(context);
    Provider.of<DealerProvider>(context, listen: false).fetchDealrs(context);
    Provider.of<DashbordProvider>(context, listen: false).getDashbord(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentInd],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: GNav(
            onTabChange: (value) {
              setState(() {
                currentInd = value;
              });
            },
            rippleColor: Colors.grey,
            hoverColor: Colors.grey,
            haptic: true,
            tabBorderRadius: 10,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 500),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.purple,
            iconSize: 24,
            tabBackgroundColor: Colors.purple.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: const [
              GButton(
                icon: Icons.bookmark_outlined,
                text: "Bookings",
              ),
              GButton(
                icon: Icons.supervised_user_circle_outlined,
                text: "Users/Dealers",
              )
            ]),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
