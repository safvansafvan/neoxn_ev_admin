import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/test_drive_service.dart';
import 'package:nexon_ev_admin/model/test_drive_model.dart';

class TestDriveProvider extends ChangeNotifier {
  final statusController = TextEditingController();
  List<TestDriveStatus> testBookingDetails = [];
  bool isLoading = false;
  bool isUpdate = false;
  Future testDriveBookingData(context) async {
    isLoading = true;
    testBookingDetails =
        await TestDriveService.getTestDriveBookingStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTestDriveBooking({context, id}) async {
    isUpdate = true;
    await TestDriveService.updateStatus(context: context, id: id);
    isUpdate = false;
    notifyListeners();
  }
}
