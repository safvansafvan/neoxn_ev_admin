import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/model/test_drive_model.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';

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
  // bool isDropdownEnabled = true;

  // @override
  // void initState() {
  //   super.initState();
  //   loadSavedStatus();
  // }

  @override
  Widget build(BuildContext context) {
    String selectedValue = ['Pending', 'Cancelled', 'Completed']
            .contains(widget.testDriveStatus.status)
        ? widget.testDriveStatus.status!
        : 'Pending';
    // final provider = Provider.of<TestDriveProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Drive Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                  titlevalue: widget.testDriveStatus.name.toString(),
                  title: "Name"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.email.toString(),
                  title: "Email"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.phone.toString(),
                  title: "Phone"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.state.toString(),
                  title: "State"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.city.toString(),
                  title: "City"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.model.toString(),
                  title: "Car Model"),
              commonHeight,
              TextWidget(
                  titlevalue: widget.testDriveStatus.dealership.toString(),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: <String>['Pending', 'Cancelled', 'Completed']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            color: Colors.grey[200],
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: value == 'Delivered' ? kgreen : kblack,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
