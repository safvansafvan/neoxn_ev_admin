import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final statusController = TextEditingController();
  List<dynamic> bookingDetailsList = [];
  bool isLoading = false;
  Future bookingsData(context) async {
    isLoading = true;
    bookingDetailsList = await BookingService.getBookingStatus(context);
    log("Data Fetched here ", name: "dataFetched");
    isLoading = false;
    notifyListeners();
  }

  Future updateStatus({context, id}) async {
    await BookingService.updateStatus(context: context, id: id);
    notifyListeners();
  }
}
