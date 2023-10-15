import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';

class DealersDetailsWidget extends StatelessWidget {
  const DealersDetailsWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.city,
    required this.state,
  });

  final String name;
  final int phone;
  final String city;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drive Booked Person Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(titlevalue: name.toString(), title: "Name"),
              commonHeight,
              TextWidget(titlevalue: phone.toString(), title: "Phone"),
              commonHeight,
              TextWidget(titlevalue: state.toString(), title: "State"),
              commonHeight,
              TextWidget(titlevalue: city.toString(), title: "City"),
              commonHeight,
            ],
          ),
        ),
      ),
    );
  }
}
