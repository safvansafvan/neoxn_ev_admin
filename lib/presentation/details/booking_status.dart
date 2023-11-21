import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/model/booking_status.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';
import 'package:provider/provider.dart';

class BookingDetailsWidget extends StatefulWidget {
  const BookingDetailsWidget({super.key, required this.bookingStatus});

  final BookingStatus bookingStatus;

  @override
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Booking Status"),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 0), child: Divider()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            TextWidget(
                titlevalue: widget.bookingStatus.names ?? 'Unknown',
                title: "First Name:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.lastName ?? 'Unknown',
                title: "Last Name:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.email ?? 'Unknown',
                title: "Email:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.phone.toString(),
                title: "Phone:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.state ?? 'Unknown',
                title: "State:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.city ?? 'Unknown',
                title: "City:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.address1 ?? 'Unknown',
                title: "Address1:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.address2 ?? 'Unknown',
                title: "Address2:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.pincode.toString(),
                title: "Pincode:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.model ?? 'Unknown',
                title: "Car Model:"),
            height10,
            TextWidget(
                titlevalue: widget.bookingStatus.dealer ?? 'Unknown',
                title: "Delaer:"),
            height10,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Status',
                style: textStyleFuc(
                    weight: FontWeight.bold, color: kblack, size: 16),
              ),
            ),
            widget.bookingStatus.status == 'Delivered'
                ? SizedBox(
                    child: ListTile(
                      title: Text(
                        'Delivered',
                        style: textStyleFuc(
                            weight: FontWeight.bold, color: kgreen, size: 16),
                      ),
                      trailing: const Icon(Icons.arrow_drop_down),
                    ),
                  )
                : Container(
                    color: Colors.grey[200],
                    child: CustomDropdown(
                      onChanged: (selected) async {
                        log(selected);
                        provider.statusController.text = selected;
                        await provider.updateStatus(
                            context: context, id: widget.bookingStatus.id!);
                      },
                      excludeSelected: true,
                      fillColor: Colors.grey[200],
                      hintText: widget.bookingStatus.status,
                      hintStyle: const TextStyle(color: Colors.black),
                      selectedStyle: TextStyle(color: kblack),
                      items: const ['Cancelled', 'Delivered'],
                      controller: provider.statusController,
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
