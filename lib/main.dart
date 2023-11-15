import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_dashbord_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_dealer_provider.dart';
import 'package:nexon_ev_admin/controller/providers/get_users_provider.dart';
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/controller/providers/loginprovider.dart';
import 'package:nexon_ev_admin/presentation/auth/login.dart';
import 'package:nexon_ev_admin/presentation/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider = LoginProvider();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestDriveProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DealerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashbordProvider(),
        )
      ],
      child: FutureBuilder(
          future: provider.init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Nexon ev admin',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: provider.isLoggedIn()
                      ? const HomeScreen()
                      : const LoginPage());
            } else {
              return const CircularProgressIndicator(
                strokeWidth: 3,
              );
            }
          }),
    );
  }
}
