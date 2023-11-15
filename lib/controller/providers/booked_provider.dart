import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/booking_service.dart';
import 'package:nexon_ev_admin/model/booking_status.dart';

class BookingProvider extends ChangeNotifier {
  final statusController = TextEditingController();
  List<BookingStatus> bookingDetailsList = [];
  bool isLoading = false;
  Future bookingsData(context) async {
    isLoading = true;
    bookingDetailsList = await BookingService.getBookingStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future updateStatus({context, id}) async {
    await BookingService.updateStatus(context: context, id: id);
    notifyListeners();
  }
}
