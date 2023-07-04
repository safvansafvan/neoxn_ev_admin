import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/presentation/detailshow/widget/text_widget.dart';

class BookingDetailsWidget extends StatelessWidget {
  const BookingDetailsWidget(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.city,
      required this.state,
      required this.address1,
      required this.address2,
      required this.pinCode,
      required this.model,
      required this.dealerShip,
      required this.status});

  final String firstName;
  final String lastName;
  final String email;
  final int phone;
  final String city;
  final String state;
  final String address1;
  final String address2;
  final int pinCode;
  final String model;
  final String dealerShip;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booked Person Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextWidget(
                  titlevalue: firstName.toString(), title: "First Name:"),
              commonHeight,
              TextWidget(titlevalue: lastName.toString(), title: "Last Name:"),
              commonHeight,
              TextWidget(titlevalue: email.toString(), title: "Email:"),
              commonHeight,
              TextWidget(titlevalue: phone.toString(), title: "Phone:"),
              commonHeight,
              TextWidget(titlevalue: state.toString(), title: "State:"),
              commonHeight,
              TextWidget(titlevalue: city.toString(), title: "City:"),
              commonHeight,
              TextWidget(titlevalue: address1.toString(), title: "Address1:"),
              commonHeight,
              TextWidget(titlevalue: address2.toString(), title: "Address2:"),
              commonHeight,
              TextWidget(titlevalue: pinCode.toString(), title: "Pincode:"),
              commonHeight,
              TextWidget(titlevalue: model.toString(), title: "Car Model:"),
              commonHeight,
              TextWidget(titlevalue: dealerShip.toString(), title: "Delaer:"),
              commonHeight,
              TextWidget(titlevalue: status.toString(), title: "Status:")
            ],
          ),
        ),
      ),
    );
  }
}
