import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/bookings_provider.dart';
import 'package:nexon_ev_admin/controller/providers/loginprovider.dart';
import 'package:nexon_ev_admin/presentation/auth/login.dart';
import 'package:nexon_ev_admin/presentation/home.dart';
import 'package:nexon_ev_admin/presentation/tab_bars/test_drive.dart';
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
      ],
      child: FutureBuilder(
          future: provider.init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
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
