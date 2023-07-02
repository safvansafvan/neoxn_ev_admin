import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/bookingserv.dart';

class TestDriveProvider extends ChangeNotifier {
  List<dynamic> bookingDetails = [];
  bool isLoading = false;
  Future bookingsData(context) async {
    isLoading = true;
    bookingDetails = await getBookingStatus(context);
    log("Data Fetched here ", name: "dataFetched");
    isLoading = false;
    notifyListeners();
  }
}
