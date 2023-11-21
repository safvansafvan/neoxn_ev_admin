import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/model/test_drive_model.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';
import 'package:provider/provider.dart';

class TestDriveBookedPersonDetails extends StatefulWidget {
  const TestDriveBookedPersonDetails(
      {super.key, required this.testDriveStatus});

  final TestDriveStatus testDriveStatus;

  @override
  State<TestDriveBookedPersonDetails> createState() =>
      _TestDriveBookedPersonDetailsState();
}

class _TestDriveBookedPersonDetailsState
    extends State<TestDriveBookedPersonDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TestDriveProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Test Drive Status"),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 0), child: Divider()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextWidget(
                  titlevalue: widget.testDriveStatus.name ?? 'Unknown',
                  title: "Name"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.email ?? 'Unknown',
                  title: "Email"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.phone.toString(),
                  title: "Phone"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.state ?? 'Unknown',
                  title: "State"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.city ?? 'Unknown',
                  title: "City"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.model ?? 'Unknown',
                  title: "Car Model"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.dealership ?? 'Unknown',
                  title: "Delaer"),
              commonHeight,
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Status',
                  style: textStyleFuc(
                      weight: FontWeight.bold, color: kblack, size: 16),
                ),
              ),
              widget.testDriveStatus.status == 'Completed'
                  ? SizedBox(
                      child: ListTile(
                        title: Text(
                          'Completed',
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
                          await provider.updateTestDriveBooking(
                              context: context, id: widget.testDriveStatus.id!);
                        },
                        excludeSelected: true,
                        fillColor: Colors.grey[200],
                        hintText: widget.testDriveStatus.status,
                        hintStyle: const TextStyle(color: Colors.black),
                        selectedStyle: TextStyle(color: kblack),
                        items: const ['Cancelled', 'Completed'],
                        controller: provider.statusController,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
