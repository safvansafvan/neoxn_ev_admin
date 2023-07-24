import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/presentation/detailshow/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingDetailsWidget extends StatefulWidget {
  const BookingDetailsWidget(
      {super.key,
      required this.id,
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
  final String id;
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
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  bool isDropdownEnabled = true;
  String selectedStatus = "";
  @override
  void initState() {
    super.initState();
    loadSelectedStatus();
  }

  Future<void> loadSelectedStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedStatus = prefs.getString('selected_status') ?? "";
    setState(() {
      selectedStatus = savedStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context, listen: false);
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
                  titlevalue: widget.firstName.toString(),
                  title: "First Name:"),
              height10,
              TextWidget(
                  titlevalue: widget.lastName.toString(), title: "Last Name:"),
              height10,
              TextWidget(titlevalue: widget.email.toString(), title: "Email:"),
              height10,
              TextWidget(titlevalue: widget.phone.toString(), title: "Phone:"),
              height10,
              TextWidget(titlevalue: widget.state.toString(), title: "State:"),
              height10,
              TextWidget(titlevalue: widget.city.toString(), title: "City:"),
              height10,
              TextWidget(
                  titlevalue: widget.address1.toString(), title: "Address1:"),
              height10,
              TextWidget(
                  titlevalue: widget.address2.toString(), title: "Address2:"),
              height10,
              TextWidget(
                  titlevalue: widget.pinCode.toString(), title: "Pincode:"),
              height10,
              TextWidget(
                  titlevalue: widget.model.toString(), title: "Car Model:"),
              height10,
              TextWidget(
                  titlevalue: widget.dealerShip.toString(), title: "Delaer:"),
              height10,
              SizedBox(
                height: 63,
                child: Center(
                  child: AbsorbPointer(
                    absorbing: !isDropdownEnabled,
                    child: Container(
                      color: selectedStatus == "Delivered"
                          ? Colors.green
                          : Colors.white,
                      child: CustomDropdown(
                        onChanged: (p0) async {
                          log(p0.toString());
                          await provider.updateStatus(
                              context: context, id: widget.id);

                          setState(() {
                            selectedStatus = p0;
                          });

                          if (p0 == "Delivered") {
                            setState(() {
                              isDropdownEnabled = false;
                            });
                          }
                          final pref = await SharedPreferences.getInstance();
                          await pref.setString(
                              'selected_status', selectedStatus);
                        },
                        excludeSelected: true,
                        fillColor: Colors.transparent,
                        hintText: widget.status,
                        hintStyle: TextStyle(
                            color: widget.status == 'Delivered'
                                ? Colors.white
                                : Colors.black),
                        selectedStyle: TextStyle(color: kblack),
                        items: const [
                          "Placed",
                          "Cancelled",
                          "Delivered",
                        ],
                        controller: provider.statusController,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
