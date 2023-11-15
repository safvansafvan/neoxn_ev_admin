import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/model/booking_status.dart';
import 'package:nexon_ev_admin/presentation/details/widget/text_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
// import 'package:animated_custom_dropdown/custom_dropdown.dart';

class BookingDetailsWidget extends StatefulWidget {
  const BookingDetailsWidget({super.key, required this.bookingStatus});

  final BookingStatus bookingStatus;

  @override
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   loadSavedStatus();
  // }

  @override
  Widget build(BuildContext context) {
    String selectedValue = ['Placed', 'Cancelled', 'Delivered']
            .contains(widget.bookingStatus.status)
        ? widget.bookingStatus.status!
        : 'Pending';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextWidget(
                  titlevalue: widget.bookingStatus.names.toString(),
                  title: "First Name:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.lastName.toString(),
                  title: "Last Name:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.email.toString(),
                  title: "Email:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.phone.toString(),
                  title: "Phone:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.state.toString(),
                  title: "State:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.city.toString(),
                  title: "City:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.address1.toString(),
                  title: "Address1:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.address2.toString(),
                  title: "Address2:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.pincode.toString(),
                  title: "Pincode:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.model.toString(),
                  title: "Car Model:"),
              height10,
              TextWidget(
                  titlevalue: widget.bookingStatus.dealer.toString(),
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
                      items: <String>['Placed', 'Cancelled', 'Delivered']
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

  // Future<void> loadSavedStatus() async {
  //   final pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedStatus = pref.getString('selected_status') ?? "";
  //     isDropdownEnabled = selectedStatus != "Delivered";
  //   });
  // }
}
