import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/booking_service.dart';
import 'package:nexon_ev_admin/model/booking_status.dart';

class BookingProvider extends ChangeNotifier {
  final statusController = TextEditingController();
  List<BookingStatus> bookingDetailsList = [];
  bool isLoading = false;
  bool isUpdate = false;

  Future bookingsData(context) async {
    isLoading = true;
    bookingDetailsList = await BookingService.getBookingStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future updateStatus(
      {required BuildContext context, required String id}) async {
    isUpdate = true;
    await BookingService.updateStatus(context: context, id: id);
    isUpdate = false;
    notifyListeners();
  }
}
