import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';

// ignore: must_be_immutable
class UserDetailsShowingScreen extends StatelessWidget {
  UserDetailsShowingScreen(
      {super.key,
      required this.username,
      required this.email,
      this.testDriveBooking});

  final String username;
  final String email;
  List? testDriveBooking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Information"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextWidget(titlevalue: username, title: "UserName:"),
            commonHeight,
            TextWidget(titlevalue: email, title: "Email:"),
            commonHeight,
          ],
        ),
      )),
    );
  }
}
