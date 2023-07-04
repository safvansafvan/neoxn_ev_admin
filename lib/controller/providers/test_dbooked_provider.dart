import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/test_drive_service.dart';

class TestDriveProvider extends ChangeNotifier {
  List<dynamic> testBookingDetails = [];
  bool isLoading = false;
  Future testDriveBookingData(context) async {
    isLoading = true;
    testBookingDetails = await getTestDriveBookingStatus(context);
    log("test drive data Fetched ", name: "dataFetched");
    isLoading = false;
    notifyListeners();
  }
}
