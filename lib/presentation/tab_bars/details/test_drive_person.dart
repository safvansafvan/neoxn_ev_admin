import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/presentation/tab_bars/details/widget/text_widget.dart';

class TestDriveBookedPersonDetails extends StatelessWidget {
  const TestDriveBookedPersonDetails(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.city,
      required this.state,
      required this.model,
      required this.dealerShip});

  final String name;
  final String email;
  final int phone;
  final String city;
  final String state;
  final String model;
  final String dealerShip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booked Person Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                TextWidget(titlevalue: name.toString(), title: "Name"),
                commonHeight,
                TextWidget(titlevalue: email.toString(), title: "Email"),
                commonHeight,
                TextWidget(titlevalue: phone.toString(), title: "Phone"),
                commonHeight,
                TextWidget(titlevalue: state.toString(), title: "State"),
                commonHeight,
                TextWidget(titlevalue: city.toString(), title: "City"),
                commonHeight,
                TextWidget(titlevalue: model.toString(), title: "Car Model"),
                commonHeight,
                TextWidget(titlevalue: dealerShip.toString(), title: "Delaer"),
                commonHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
